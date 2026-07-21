import '../../../../core/config/tracking_config.dart';
import '../../../buses/domain/entities/bus.dart';

class DirectionDetector {
  BusDirection detect(List<double> progressHistory) {
    if (progressHistory.length < 3) return BusDirection.unknown;
    final deltas = <double>[];
    for (var i = 1; i < progressHistory.length; i++) {
      final delta = progressHistory[i] - progressHistory[i - 1];
      if (delta.abs() < .002) continue;
      deltas.add(delta);
    }
    if (deltas.isEmpty) return BusDirection.unknown;
    final net = progressHistory.last - progressHistory.first;
    final positive = deltas.where((value) => value > 0).length / deltas.length;
    if (net >= TrackingConfig.directionMinProgressDelta && positive >= .7) {
      return BusDirection.forward;
    }
    if (net <= -TrackingConfig.directionMinProgressDelta && positive <= .3) {
      return BusDirection.reverse;
    }
    return BusDirection.unknown;
  }
}
