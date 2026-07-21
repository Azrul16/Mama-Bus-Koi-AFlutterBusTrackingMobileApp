import 'package:equatable/equatable.dart';

enum UserRole { user, organizationAdmin, organizationOwner, platformAdmin }

enum MembershipStatus { pending, active, suspended }

class OrganizationMembership extends Equatable {
  const OrganizationMembership({
    required this.organizationId,
    required this.userId,
    required this.role,
    required this.status,
    required this.createdAt,
  });
  final String organizationId, userId;
  final UserRole role;
  final MembershipStatus status;
  final DateTime createdAt;
  @override
  List<Object> get props => [organizationId, userId, role, status, createdAt];
}

class AppUser extends Equatable {
  const AppUser({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.role,
    required this.createdAt,
    this.institutionId,
    this.referralCode,
    this.referredBy,
    this.gender,
    this.department,
    this.active = true,
  });
  final String uid, displayName, email;
  final UserRole role;
  final DateTime createdAt;
  final String? institutionId, referralCode, referredBy;
  final String? gender, department;
  final bool active;
  bool get isPlatformAdmin => role == UserRole.platformAdmin;
  bool get isAdmin =>
      role == UserRole.organizationAdmin ||
      role == UserRole.organizationOwner ||
      isPlatformAdmin;
  bool get hasCompleteProfile =>
      displayName.trim().isNotEmpty &&
      gender?.trim().isNotEmpty == true &&
      department?.trim().isNotEmpty == true;
  AppUser copyWith({
    String? institutionId,
    UserRole? role,
    String? displayName,
    String? gender,
    String? department,
  }) => AppUser(
    uid: uid,
    displayName: displayName ?? this.displayName,
    email: email,
    role: role ?? this.role,
    createdAt: createdAt,
    institutionId: institutionId ?? this.institutionId,
    referralCode: referralCode,
    referredBy: referredBy,
    gender: gender ?? this.gender,
    department: department ?? this.department,
    active: active,
  );
  @override
  List<Object?> get props => [
    uid,
    displayName,
    email,
    role,
    createdAt,
    institutionId,
    referralCode,
    referredBy,
    active,
    gender,
    department,
  ];
}
