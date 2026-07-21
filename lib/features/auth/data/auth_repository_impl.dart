import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/database/app_database.dart' as db;
import '../../../core/errors/app_exception.dart';
import '../../../core/firebase/firebase_paths.dart';
import '../domain/entities/app_user.dart';
import '../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._auth, this._firestore, this._database) {
    _googleInitialization = kIsWeb
        ? Future<void>.value()
        : GoogleSignIn.instance.initialize();
    _authSubscription = _auth.authStateChanges().listen((_) => _emitCurrent());
  }
  final firebase.FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final db.AppDatabase _database;
  final _controller = StreamController<AppUser?>.broadcast();
  StreamSubscription<firebase.User?>? _authSubscription;
  late final Future<void> _googleInitialization;

  @override
  Stream<AppUser?> watchCurrentUser() async* {
    yield await _loadCurrent();
    yield* _controller.stream;
  }

  Future<void> _emitCurrent() async => _controller.add(await _loadCurrent());

  Future<AppUser?> _loadCurrent() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;
    try {
      final reference = _firestore
          .collection(FirebasePaths.users)
          .doc(firebaseUser.uid);
      var snapshot = await reference.get();
      if (!snapshot.exists) {
        final created = _defaultProfile(firebaseUser);
        await reference.set(_toFirestore(created));
        await _cache(created);
        await _syncAccess(created);
        return created;
      }
      var profile = _fromFirestore(firebaseUser, snapshot.data()!);
      profile = await _withMembershipRole(profile);
      await _cache(profile);
      await _syncAccess(profile);
      return profile;
    } catch (_) {
      final cached = await (_database.select(
        _database.userProfiles,
      )..where((row) => row.uid.equals(firebaseUser.uid))).getSingleOrNull();
      if (cached != null) return _fromRow(cached);
      return _defaultProfile(firebaseUser);
    }
  }

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) => _guard(
    () => _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    ),
  );

  @override
  Future<void> registerWithEmail({
    required String name,
    required String email,
    required String password,
  }) => _guard(() async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    await credential.user?.updateDisplayName(name.trim());
    await _emitCurrent();
  });

  @override
  Future<void> signInWithGoogle() => _guard(() async {
    final provider = firebase.GoogleAuthProvider();
    if (kIsWeb) {
      await _auth.signInWithPopup(provider);
    } else {
      await _googleInitialization;
      final googleUser = await GoogleSignIn.instance.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = firebase.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
    }
  });

  @override
  Future<void> updateInstitution(String institutionId) => _guard(() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw const AuthenticationException('You are signed out.');
    }
    final organization = await _firestore
        .collection(FirebasePaths.organizations)
        .doc(institutionId)
        .get();
    if (!organization.exists || organization.data()?['status'] == 'suspended') {
      throw const AuthenticationException('This organization is unavailable.');
    }
    final accessMode =
        organization.data()?['accessMode'] as String? ?? 'public';
    if (accessMode != 'public') {
      throw const AuthenticationException(
        'This organization requires a join code, approval, or invitation.',
      );
    }
    final membershipId = '${institutionId}_${user.uid}';
    await _firestore
        .collection(FirebasePaths.memberships)
        .doc(membershipId)
        .set({
          'organizationId': institutionId,
          'userId': user.uid,
          'role': 'user',
          'status': 'active',
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
    await _firestore.collection(FirebasePaths.users).doc(user.uid).set({
      'currentOrganizationId': institutionId,
    }, SetOptions(merge: true));
    final current = await _loadCurrent();
    if (current != null) {
      final updated = current.copyWith(institutionId: institutionId);
      await _cache(updated);
      await _syncAccess(updated);
      _controller.add(updated);
    }
  });

  @override
  Future<void> updateProfile({
    required String fullName,
    required String gender,
    required String department,
  }) => _guard(() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw const AuthenticationException('You are signed out.');
    await _firestore.collection(FirebasePaths.users).doc(uid).update({
      'displayName': fullName.trim(),
      'gender': gender,
      'department': department.trim(),
      'profileCompletedAt': FieldValue.serverTimestamp(),
    });
    await _emitCurrent();
  });

  @override
  Future<void> signOut() => _auth.signOut();

  Future<void> _guard(Future<void> Function() action) async {
    try {
      await action();
    } on firebase.FirebaseAuthException catch (error) {
      throw AuthenticationException(error.message ?? 'Authentication failed.');
    }
  }

  AppUser _defaultProfile(firebase.User user) {
    return AppUser(
      uid: user.uid,
      displayName: _nonEmpty(user.displayName) ?? 'Member',
      email: user.email ?? '',
      role: UserRole.user,
      createdAt: DateTime.now(),
      referralCode: user.uid
          .substring(0, user.uid.length < 6 ? user.uid.length : 6)
          .toUpperCase(),
    );
  }

  AppUser _fromFirestore(firebase.User user, Map<String, dynamic> json) {
    final isGoogle = user.providerData.any(
      (provider) => provider.providerId == 'google.com',
    );
    final accountName = _nonEmpty(user.displayName);
    return AppUser(
      uid: user.uid,
      displayName: isGoogle
          ? accountName ?? 'Member'
          : _nonEmpty(json['displayName'] as String?) ??
                accountName ??
                'Member',
      email: json['email'] as String? ?? user.email ?? '',
      role: _role(json['role'] as String?),
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      institutionId:
          json['currentOrganizationId'] as String? ??
          json['institutionId'] as String?,
      referralCode: json['referralCode'] as String?,
      referredBy: json['referredBy'] as String?,
      active: json['active'] as bool? ?? true,
      gender: json['gender'] as String?,
      department: json['department'] as String?,
    );
  }

  AppUser _fromRow(db.UserProfile row) => AppUser(
    uid: row.uid,
    displayName: row.displayName,
    email: row.email,
    role: _role(row.role),
    createdAt: row.createdAt,
    institutionId: row.institutionId,
    referralCode: row.referralCode,
    referredBy: row.referredBy,
    active: row.active,
    gender: row.gender,
    department: row.department,
  );
  UserRole _role(String? value) => switch (value) {
    'organization_admin' || 'admin' => UserRole.organizationAdmin,
    'organization_owner' => UserRole.organizationOwner,
    'platform_admin' || 'super_admin' => UserRole.platformAdmin,
    _ => UserRole.user,
  };
  Future<AppUser> _withMembershipRole(AppUser user) async {
    final organizationId = user.institutionId;
    if (organizationId == null || user.role == UserRole.platformAdmin) {
      return user;
    }
    final membership = await _firestore
        .collection(FirebasePaths.memberships)
        .doc('${organizationId}_${user.uid}')
        .get();
    if (!membership.exists || membership.data()?['status'] != 'active') {
      return user.copyWith(role: UserRole.user);
    }
    return user.copyWith(role: _role(membership.data()?['role'] as String?));
  }

  Map<String, Object?> _toFirestore(AppUser user) => {
    'uid': user.uid,
    'displayName': user.displayName,
    'email': user.email,
    'role': _roleValue(user.role),
    'currentOrganizationId': user.institutionId,
    'referralCode': user.referralCode,
    'referredBy': user.referredBy,
    'createdAt': FieldValue.serverTimestamp(),
    'active': user.active,
    'gender': user.gender,
    'department': user.department,
  };
  Future<void> _cache(AppUser user) => _database
      .into(_database.userProfiles)
      .insert(
        db.UserProfilesCompanion.insert(
          uid: user.uid,
          displayName: user.displayName,
          email: user.email,
          role: Value(_roleValue(user.role)),
          institutionId: Value(user.institutionId),
          referralCode: Value(user.referralCode),
          referredBy: Value(user.referredBy),
          createdAt: user.createdAt,
          active: Value(user.active),
          gender: Value(user.gender),
          department: Value(user.department),
        ),
        mode: InsertMode.insertOrReplace,
      );

  Future<void> _syncAccess(AppUser user) async {
    // RTDB cannot validate a Firestore membership. A trusted backend/extension
    // must mirror membership changes; clients must never grant themselves live
    // database access by copying an organization ID.
    return;
  }

  String _roleValue(UserRole role) => switch (role) {
    UserRole.organizationAdmin => 'organization_admin',
    UserRole.organizationOwner => 'organization_owner',
    UserRole.platformAdmin => 'platform_admin',
    UserRole.user => 'user',
  };

  String? _nonEmpty(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  Future<void> dispose() async {
    await _authSubscription?.cancel();
    await _controller.close();
  }
}
