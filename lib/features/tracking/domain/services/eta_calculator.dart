import '../../../../core/config/tracking_config.dart';
import '../entities/gps_sample.dart';

class EtaCalculator {
  Duration? calculate({
    required double routeDistanceMeters,
    required double progress,
    required bool reverse,
    required List<GpsSample> samples,
  }) {
    final speeds = samples
        .map((item) => item.speedMps)
        .where((speed) => speed >= TrackingConfig.minimumEtaSpeedMps)
        .toList();
    if (speeds.length < 2) return null;
    final average =
        speeds.fold<double>(0, (sum, value) => sum + value) / speeds.length;
    final remaining =
        routeDistanceMeters * (reverse ? progress : 1 - progress).clamp(0, 1);
    return Duration(seconds: (remaining / average).round());
  }
}
