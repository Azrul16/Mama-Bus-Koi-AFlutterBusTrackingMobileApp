import '../entities/contribution_summary.dart';

abstract interface class ContributionRewardRepository {
  Stream<List<ContributionSummary>> watchPending(String institutionId);
  Future<void> review(ContributionSummary summary, bool approve);
}
