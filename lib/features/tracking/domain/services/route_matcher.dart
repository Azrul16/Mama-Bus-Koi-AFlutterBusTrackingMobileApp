import '../../../../core/config/tracking_config.dart';
import '../../../../core/utils/geo_geometry.dart';
import '../../../routes/domain/entities/route.dart';
import '../entities/gps_sample.dart';

enum RouteMatchState { unknown, candidate, confirmed }

class RouteMatch {
  const RouteMatch({
    required this.state,
    this.route,
    this.confidence = 0,
    this.meanDistanceMeters = double.infinity,
    this.progress = 0,
  });
  final RouteMatchState state;
  final BusRoute? route;
  final double confidence, meanDistanceMeters, progress;
}

class RouteMatcher {
  String? _candidateId, _confirmedId;
  int _candidateSamples = 0;

  RouteMatch detect(List<GpsSample> samples, List<BusRoute> routes) {
    final valid = samples
        .where(
          (sample) =>
              sample.accuracyMeters <= TrackingConfig.maxGpsAccuracyMeters,
        )
        .toList();
    if (valid.length < 2 || routes.isEmpty) {
      return const RouteMatch(state: RouteMatchState.unknown);
    }
    final scored = routes.where((route) => route.points.length > 1).map((
      route,
    ) {
      final projections = valid
          .map(
            (sample) =>
                GeoGeometry.nearestPointOnPolyline(sample.point, route.points),
          )
          .toList();
      final mean =
          projections.fold<double>(
            0,
            (sum, item) => sum + item.distanceMeters,
          ) /
          projections.length;
      final inside =
          projections
              .where((item) => item.distanceMeters <= route.routeCorridorMeters)
              .length /
          projections.length;
      final score =
          (inside * .7 +
                  (1 - (mean / (route.routeCorridorMeters * 2)).clamp(0, 1)) *
                      .3)
              .clamp(0, 1)
              .toDouble();
      return RouteMatch(
        state: RouteMatchState.candidate,
        route: route,
        confidence: score,
        meanDistanceMeters: mean,
        progress: projections.last.progress,
      );
    }).toList()..sort((a, b) => b.confidence.compareTo(a.confidence));
    if (scored.isEmpty || scored.first.confidence < .55) {
      _candidateId = null;
      _candidateSamples = 0;
      return const RouteMatch(state: RouteMatchState.unknown);
    }
    final best = scored.first;
    if (scored.length > 1 &&
        best.confidence - scored[1].confidence < .12 &&
        _confirmedId == null) {
      return RouteMatch(
        state: RouteMatchState.candidate,
        route: best.route,
        confidence: best.confidence,
        meanDistanceMeters: best.meanDistanceMeters,
        progress: best.progress,
      );
    }
    if (_candidateId == best.route!.id) {
      _candidateSamples++;
    } else {
      _candidateId = best.route!.id;
      _candidateSamples = 1;
    }
    if (_confirmedId != null && _confirmedId != best.route!.id) {
      final current = scored
          .where((item) => item.route?.id == _confirmedId)
          .firstOrNull;
      if (current != null &&
          best.confidence >
              current.confidence * TrackingConfig.routeSwitchImprovementRatio) {
        return RouteMatch(
          state: RouteMatchState.confirmed,
          route: current.route,
          confidence: current.confidence,
          meanDistanceMeters: current.meanDistanceMeters,
          progress: current.progress,
        );
      }
    }
    if (_candidateSamples >= TrackingConfig.routeConfirmationSamples) {
      _confirmedId = best.route!.id;
    }
    return RouteMatch(
      state: _confirmedId == best.route!.id
          ? RouteMatchState.confirmed
          : RouteMatchState.candidate,
      route: best.route,
      confidence: best.confidence,
      meanDistanceMeters: best.meanDistanceMeters,
      progress: best.progress,
    );
  }

  void reset() {
    _candidateId = null;
    _confirmedId = null;
    _candidateSamples = 0;
  }
}
