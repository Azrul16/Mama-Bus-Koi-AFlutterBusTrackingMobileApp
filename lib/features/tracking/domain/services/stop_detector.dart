import '../../../buses/domain/entities/bus.dart';
import '../../../routes/domain/entities/route.dart';

class StopInfo {
  const StopInfo({
    this.nearest,
    this.next,
    this.destination,
    this.passed = const [],
  });
  final BusStop? nearest, next, destination;
  final List<BusStop> passed;
}

class StopDetector {
  StopInfo detect(
    List<BusStop> stops,
    double progress,
    BusDirection direction,
  ) {
    if (stops.isEmpty) return const StopInfo();
    final ordered = [...stops]
      ..sort((a, b) => a.routeProgress.compareTo(b.routeProgress));
    final nearest = ordered.reduce(
      (a, b) =>
          (a.routeProgress - progress).abs() <=
              (b.routeProgress - progress).abs()
          ? a
          : b,
    );
    if (direction == BusDirection.reverse) {
      final previous = ordered
          .where((stop) => stop.routeProgress < progress - .002)
          .toList();
      return StopInfo(
        nearest: nearest,
        next: previous.isEmpty ? ordered.first : previous.last,
        destination: ordered.first,
        passed: ordered
            .where((stop) => stop.routeProgress > progress)
            .toList()
            .reversed
            .toList(),
      );
    }
    final upcoming = ordered
        .where((stop) => stop.routeProgress > progress + .002)
        .toList();
    return StopInfo(
      nearest: nearest,
      next: upcoming.isEmpty ? ordered.last : upcoming.first,
      destination: ordered.last,
      passed: ordered.where((stop) => stop.routeProgress < progress).toList(),
    );
  }
}
