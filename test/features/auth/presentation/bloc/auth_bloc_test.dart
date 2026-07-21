import 'package:bloc_test/bloc_test.dart';
import 'package:buskoi/features/auth/domain/entities/app_user.dart';
import 'package:buskoi/features/auth/domain/repositories/auth_repository.dart';
import 'package:buskoi/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this.user);
  AppUser? user;
  @override
  Stream<AppUser?> watchCurrentUser() => Stream.value(user);
  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {}
  @override
  Future<void> registerWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {}
  @override
  Future<void> signInWithGoogle() async {}
  @override
  Future<void> signOut() async {
    user = null;
  }

  @override
  Future<void> updateInstitution(String institutionId) async {
    user = user?.copyWith(institutionId: institutionId);
  }

  @override
  Future<void> updateProfile({
    required String fullName,
    required String gender,
    required String department,
  }) async {
    user = user?.copyWith(
      displayName: fullName,
      gender: gender,
      department: department,
    );
  }
}

void main() {
  final user = AppUser(
    uid: 'uid',
    displayName: 'Student',
    email: 'student@example.com',
    role: UserRole.user,
    createdAt: DateTime(2026),
  );

  blocTest<AuthBloc, AuthState>(
    'restores an authenticated profile that still needs institution selection',
    build: () => AuthBloc(FakeAuthRepository(user)),
    act: (bloc) => bloc.add(const AuthStarted()),
    wait: const Duration(milliseconds: 10),
    verify: (bloc) {
      expect(bloc.state.status, AuthStatus.authenticated);
      expect(bloc.state.needsInstitution, isTrue);
    },
  );

  test('admin and super-admin roles share the protected admin capability', () {
    expect(
      AppUser(
        uid: 'a',
        displayName: 'A',
        email: 'a@x.com',
        role: UserRole.organizationAdmin,
        createdAt: DateTime(2026),
      ).isAdmin,
      isTrue,
    );
    expect(
      AppUser(
        uid: 's',
        displayName: 'S',
        email: 's@x.com',
        role: UserRole.platformAdmin,
        createdAt: DateTime(2026),
      ).isAdmin,
      isTrue,
    );
  });
}
