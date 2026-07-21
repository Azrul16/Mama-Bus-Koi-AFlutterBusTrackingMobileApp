import 'package:firebase_database/firebase_database.dart';
import '../../wallet/domain/repositories/wallet_repository.dart';
import '../domain/entities/contribution_summary.dart';
import '../domain/repositories/contribution_reward_repository.dart';

class ContributionRewardRepositoryImpl implements ContributionRewardRepository {
  ContributionRewardRepositoryImpl(this._database, this._wallets);
  final FirebaseDatabase _database;
  final WalletRepository _wallets;
  @override
  Stream<List<ContributionSummary>> watchPending(
    String institutionId,
  ) => _database.ref('contribution_summaries/$institutionId').onValue.map((
    event,
  ) {
    final value = event.snapshot.value;
    if (value is! Map) return const [];
    return value.entries
        .where(
          (entry) =>
              entry.value is Map && (entry.value as Map)['status'] == 'PENDING',
        )
        .map((entry) {
          final data = Map<String, dynamic>.from(entry.value as Map);
          return ContributionSummary(
            id: entry.key.toString(),
            institutionId: institutionId,
            userId: data['userId'] as String,
            busId: data['busId'] as String,
            tripId: data['tripId'] as String?,
            durationSeconds: (data['durationSeconds'] as num).toInt(),
            wasPrimary: data['wasPrimary'] as bool? ?? false,
            status: data['status'] as String,
          );
        })
        .toList();
  });
  @override
  Future<void> review(ContributionSummary summary, bool approve) async {
    final ref = _database.ref(
      'contribution_summaries/${summary.institutionId}/${summary.id}',
    );
    final snapshot = await ref.get();
    if (snapshot.child('status').value != 'PENDING') {
      throw StateError('Contribution was already reviewed.');
    }
    if (approve) await _wallets.grantTestTokens(summary.userId, 10);
    await ref.update({
      'status': approve ? 'APPROVED' : 'REJECTED',
      'reviewedAt': ServerValue.timestamp,
    });
  }
}
