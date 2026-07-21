import '../entities/referral_claim.dart';

abstract interface class ReferralRepository {
  Future<void> createClaim({
    required String claimantUserId,
    required String referralCode,
  });
  Stream<List<ReferralClaim>> watchPendingClaims();
  Future<void> review(String claimId, bool approve);
}
