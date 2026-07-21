import '../entities/live_bus.dart';
import '../../../routes/domain/entities/route.dart';

abstract interface class TrackingRepository {
  Stream<LiveBus?> watchLiveBus(String institutionId, String busId);
  Stream<ContributionSession?> watchContribution();
  Future<void> startContributing({
    required String institutionId,
    required String busId,
    required String busName,
    required String userId,
    required List<BusRoute> routes,
  });
  Future<void> stopContributing();
}
