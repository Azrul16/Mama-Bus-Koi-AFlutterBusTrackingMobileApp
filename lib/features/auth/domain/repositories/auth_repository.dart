import '../entities/app_user.dart';

abstract interface class AuthRepository {
  Stream<AppUser?> watchCurrentUser();
  Future<void> signInWithEmail({
    required String email,
    required String password,
  });
  Future<void> registerWithEmail({
    required String name,
    required String email,
    required String password,
  });
  Future<void> signInWithGoogle();
  Future<void> updateInstitution(String institutionId);
  Future<void> updateProfile({
    required String fullName,
    required String gender,
    required String department,
  });
  Future<void> signOut();
}
