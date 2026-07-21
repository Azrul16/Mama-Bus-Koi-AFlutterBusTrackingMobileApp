import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart' hide Column;
import '../../../core/database/app_database.dart' as db;
import '../../../core/firebase/firebase_paths.dart';
import '../domain/entities/institution.dart';
import '../domain/repositories/institution_repository.dart';

class InstitutionRepositoryImpl implements InstitutionRepository {
  InstitutionRepositoryImpl(this._database, this._firestore);
  final db.AppDatabase _database;
  final FirebaseFirestore _firestore;

  @override
  Future<String> createOrganization({
    required String ownerId,
    required String name,
    required String location,
    required OrganizationType type,
  }) async {
    final document = _firestore.collection(FirebasePaths.organizations).doc();
    final slugBase = name.toLowerCase().trim().replaceAll(
      RegExp(r'[^a-z0-9]+'),
      '-',
    );
    final slug =
        '${slugBase.replaceAll(RegExp(r'^-|-$'), '')}-${document.id.substring(0, 6).toLowerCase()}';
    final batch = _firestore.batch();
    batch.set(document, {
      'name': name.trim(),
      'shortName': name.trim(),
      'slug': slug,
      'type': type.name,
      'status': 'trial',
      'plan': 'free',
      'accessMode': 'public',
      'location': location.trim(),
      'timezone': 'Asia/Dhaka',
      'createdBy': ownerId,
      'createdAt': FieldValue.serverTimestamp(),
      'features': {
        'crowdsourcedTracking': true,
        'tokenPremium': true,
        'publicBusSearch': true,
        'schedules': true,
      },
    });
    batch.set(
      _firestore
          .collection(FirebasePaths.memberships)
          .doc('${document.id}_$ownerId'),
      {
        'organizationId': document.id,
        'userId': ownerId,
        'role': 'organization_owner',
        'status': 'active',
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
    batch.set(
      _firestore.collection('organization_subscriptions').doc(document.id),
      {
        'organizationId': document.id,
        'plan': 'free',
        'status': 'active',
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
    await batch.commit();
    await refresh();
    return document.id;
  }

  @override
  Stream<List<Institution>> watchInstitutions() =>
      (_database.select(
        _database.institutions,
      )..where((row) => row.active.equals(true))).watch().map(
        (rows) => rows
            .map(
              (row) => Institution(
                id: row.id,
                name: row.name,
                shortName: row.shortName.isEmpty ? row.name : row.shortName,
                slug: row.slug.isEmpty ? row.id : row.slug,
                type: _type(row.type),
                status: _status(row.status),
                plan: _plan(row.plan),
                accessMode: _accessMode(row.accessMode),
                location: row.location,
                timezone: row.timezone,
              ),
            )
            .toList(),
      );

  @override
  Future<void> refresh() async {
    final snapshot = await _firestore
        .collection(FirebasePaths.institutions)
        .where(
          'accessMode',
          whereIn: ['public', 'code_required', 'approval_required'],
        )
        .get();
    for (final doc in snapshot.docs) {
      final data = doc.data();
      await _database
          .into(_database.institutions)
          .insert(
            db.InstitutionsCompanion.insert(
              id: doc.id,
              name: data['name'] as String? ?? doc.id,
              shortName: Value(data['shortName'] as String? ?? ''),
              slug: Value(data['slug'] as String? ?? doc.id),
              type: Value(data['type'] as String? ?? 'university'),
              status: Value(data['status'] as String? ?? 'trial'),
              plan: Value(data['plan'] as String? ?? 'free'),
              accessMode: Value(data['accessMode'] as String? ?? 'public'),
              location: Value(data['location'] as String? ?? ''),
              timezone: Value(data['timezone'] as String? ?? 'Asia/Dhaka'),
              active: Value((data['status'] as String?) != 'suspended'),
            ),
            mode: InsertMode.insertOrReplace,
          );
    }
  }

  OrganizationType _type(String value) => switch (value) {
    'school' => OrganizationType.school,
    'college' => OrganizationType.college,
    'corporate' => OrganizationType.corporate,
    'factory' => OrganizationType.factory,
    'other' => OrganizationType.other,
    _ => OrganizationType.university,
  };
  OrganizationStatus _status(String value) => switch (value) {
    'active' => OrganizationStatus.active,
    'suspended' => OrganizationStatus.suspended,
    _ => OrganizationStatus.trial,
  };
  OrganizationPlan _plan(String value) => switch (value) {
    'starter' => OrganizationPlan.starter,
    'pro' => OrganizationPlan.pro,
    'enterprise' => OrganizationPlan.enterprise,
    _ => OrganizationPlan.free,
  };
  OrganizationAccessMode _accessMode(String value) => switch (value) {
    'code_required' => OrganizationAccessMode.codeRequired,
    'approval_required' => OrganizationAccessMode.approvalRequired,
    'private' => OrganizationAccessMode.private,
    _ => OrganizationAccessMode.public,
  };
}
