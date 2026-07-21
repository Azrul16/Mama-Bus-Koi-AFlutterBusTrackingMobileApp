import 'package:cloud_firestore/cloud_firestore.dart';
import '../../wallet/domain/repositories/wallet_repository.dart';
import '../domain/entities/referral_claim.dart';
import '../domain/repositories/referral_repository.dart';

class ReferralRepositoryImpl implements ReferralRepository {
  ReferralRepositoryImpl(this._firestore, this._wallets);
  final FirebaseFirestore _firestore;
  final WalletRepository _wallets;
  @override
  Future<void> createClaim({
    required String claimantUserId,
    required String referralCode,
  }) async {
    final existing = await _firestore
        .collection('referralClaims')
        .where('claimantUserId', isEqualTo: claimantUserId)
        .limit(1)
        .get();
    if (existing.docs.isNotEmpty) {
      throw StateError('A referral has already been claimed.');
    }
    final referrer = await _firestore
        .collection('users')
        .where('referralCode', isEqualTo: referralCode.trim().toUpperCase())
        .limit(1)
        .get();
    if (referrer.docs.isEmpty || referrer.docs.first.id == claimantUserId) {
      throw StateError('Referral code is invalid.');
    }
    await _firestore.collection('referralClaims').doc(claimantUserId).set({
      'claimantUserId': claimantUserId,
      'referrerUserId': referrer.docs.first.id,
      'referralCode': referralCode.trim().toUpperCase(),
      'status': 'PENDING',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Stream<List<ReferralClaim>> watchPendingClaims() => _firestore
      .collection('referralClaims')
      .where('status', isEqualTo: 'PENDING')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map((doc) {
          final data = doc.data();
          return ReferralClaim(
            id: doc.id,
            claimantUserId: data['claimantUserId'] as String,
            referrerUserId: data['referrerUserId'] as String,
            referralCode: data['referralCode'] as String,
            status: ReferralStatus.pending,
            createdAt:
                (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
          );
        }).toList(),
      );
  @override
  Future<void> review(String claimId, bool approve) async {
    final ref = _firestore.collection('referralClaims').doc(claimId);
    final snapshot = await ref.get();
    if (!snapshot.exists || snapshot.data()!['status'] != 'PENDING') {
      throw StateError('Claim was already reviewed.');
    }
    if (approve) {
      await _wallets.grantTestTokens(
        snapshot.data()!['referrerUserId'] as String,
        50,
      );
    }
    await ref.update({
      'status': approve ? 'APPROVED' : 'REJECTED',
      'reviewedAt': FieldValue.serverTimestamp(),
    });
  }
}
