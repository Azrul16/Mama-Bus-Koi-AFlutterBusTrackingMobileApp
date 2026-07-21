import '../../../../core/config/tracking_config.dart';
import '../../../buses/domain/entities/bus.dart';
import '../entities/gps_sample.dart';

class BusStatusEngine {
  TrackingStatus evaluate({
    required DateTime now,
    required List<GpsSample> samples,
    required bool hasSource,
    required bool routeConfirmed,
    required double routeProgress,
    required BusDirection direction,
  }) {
    if (!hasSource) return TrackingStatus.offline;
    if (samples.isEmpty ||
        now.difference(samples.last.timestamp) >= TrackingConfig.gpsLost) {
      return TrackingStatus.gpsLost;
    }
    if (!routeConfirmed) return TrackingStatus.detecting;
    final recent = samples
        .where(
          (sample) =>
              now.difference(sample.timestamp) <=
              TrackingConfig.stoppedDuration,
        )
        .toList();
    final stopped =
        recent.isNotEmpty &&
        recent.every(
          (sample) => sample.speedMps <= TrackingConfig.stoppedSpeedMps,
        );
    final nearEnd = direction == BusDirection.reverse
        ? routeProgress <= .02
        : routeProgress >= .98;
    if (stopped && nearEnd) return TrackingStatus.arrived;
    if (stopped && recent.length >= 3) return TrackingStatus.stopped;
    return TrackingStatus.moving;
  }
}
