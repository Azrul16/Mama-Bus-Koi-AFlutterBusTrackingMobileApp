import 'package:equatable/equatable.dart';

enum ReferralStatus { pending, approved, rejected }

class ReferralClaim extends Equatable {
  const ReferralClaim({
    required this.id,
    required this.claimantUserId,
    required this.referrerUserId,
    required this.referralCode,
    required this.status,
    required this.createdAt,
    this.reviewedAt,
  });
  final String id, claimantUserId, referrerUserId, referralCode;
  final ReferralStatus status;
  final DateTime createdAt;
  final DateTime? reviewedAt;
  @override
  List<Object?> get props => [
    id,
    claimantUserId,
    referrerUserId,
    referralCode,
    status,
    createdAt,
    reviewedAt,
  ];
}
