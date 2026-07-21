import 'dart:math' as math;
import '../../features/routes/domain/entities/route.dart';

class PolylineProjection {
  const PolylineProjection({
    required this.point,
    required this.distanceMeters,
    required this.progress,
    required this.segmentIndex,
  });
  final GeoPoint point;
  final double distanceMeters, progress;
  final int segmentIndex;
}

abstract final class GeoGeometry {
  static const earthRadiusMeters = 6371000.0;

  static double haversineDistance(GeoPoint a, GeoPoint b) {
    final lat1 = _radians(a.latitude), lat2 = _radians(b.latitude);
    final dLat = lat2 - lat1, dLon = _radians(b.longitude - a.longitude);
    final value =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    return earthRadiusMeters *
        2 *
        math.atan2(math.sqrt(value), math.sqrt(1 - value));
  }

  static GeoPoint projectPointOntoSegment(
    GeoPoint point,
    GeoPoint start,
    GeoPoint end,
  ) => _segmentProjection(point, start, end).$1;

  static PolylineProjection nearestPointOnPolyline(
    GeoPoint point,
    List<GeoPoint> polyline,
  ) {
    if (polyline.isEmpty) {
      throw ArgumentError.value(polyline, 'polyline', 'must not be empty');
    }
    if (polyline.length == 1) {
      return PolylineProjection(
        point: polyline.first,
        distanceMeters: haversineDistance(point, polyline.first),
        progress: 0,
        segmentIndex: 0,
      );
    }
    final lengths = <double>[];
    double total = 0;
    for (var i = 0; i < polyline.length - 1; i++) {
      final length = haversineDistance(polyline[i], polyline[i + 1]);
      lengths.add(length);
      total += length;
    }
    var bestDistance = double.infinity,
        bestProgress = 0.0,
        bestIndex = 0,
        traversed = 0.0;
    var bestPoint = polyline.first;
    for (var i = 0; i < polyline.length - 1; i++) {
      final result = _segmentProjection(point, polyline[i], polyline[i + 1]);
      final distance = haversineDistance(point, result.$1);
      if (distance < bestDistance) {
        bestDistance = distance;
        bestPoint = result.$1;
        bestIndex = i;
        bestProgress = total == 0
            ? 0
            : (traversed + lengths[i] * result.$2) / total;
      }
      traversed += lengths[i];
    }
    return PolylineProjection(
      point: bestPoint,
      distanceMeters: bestDistance,
      progress: bestProgress.clamp(0, 1),
      segmentIndex: bestIndex,
    );
  }

  static double distancePointToPolyline(
    GeoPoint point,
    List<GeoPoint> polyline,
  ) => nearestPointOnPolyline(point, polyline).distanceMeters;
  static double progressAlongPolyline(
    GeoPoint point,
    List<GeoPoint> polyline,
  ) => nearestPointOnPolyline(point, polyline).progress;
  static double polylineLength(List<GeoPoint> polyline) {
    var total = 0.0;
    for (var i = 0; i < polyline.length - 1; i++) {
      total += haversineDistance(polyline[i], polyline[i + 1]);
    }
    return total;
  }

  static GeoPoint interpolate(List<GeoPoint> polyline, double progress) {
    if (polyline.isEmpty) throw ArgumentError('Polyline must not be empty');
    if (polyline.length == 1) return polyline.first;
    final target = polylineLength(polyline) * progress.clamp(0, 1);
    var traversed = 0.0;
    for (var i = 0; i < polyline.length - 1; i++) {
      final length = haversineDistance(polyline[i], polyline[i + 1]);
      if (traversed + length >= target) {
        final t = length == 0 ? 0.0 : (target - traversed) / length;
        return GeoPoint(
          polyline[i].latitude +
              (polyline[i + 1].latitude - polyline[i].latitude) * t,
          polyline[i].longitude +
              (polyline[i + 1].longitude - polyline[i].longitude) * t,
        );
      }
      traversed += length;
    }
    return polyline.last;
  }

  static List<GeoPoint> simplify(
    List<GeoPoint> points,
    double toleranceMeters,
  ) {
    if (points.length < 3) return List.unmodifiable(points);
    var maxDistance = 0.0, index = 0;
    for (var i = 1; i < points.length - 1; i++) {
      final projected = projectPointOntoSegment(
        points[i],
        points.first,
        points.last,
      );
      final distance = haversineDistance(points[i], projected);
      if (distance > maxDistance) {
        index = i;
        maxDistance = distance;
      }
    }
    if (maxDistance <= toleranceMeters) return [points.first, points.last];
    final left = simplify(points.sublist(0, index + 1), toleranceMeters);
    final right = simplify(points.sublist(index), toleranceMeters);
    return [...left.take(left.length - 1), ...right];
  }

  static (GeoPoint, double) _segmentProjection(
    GeoPoint point,
    GeoPoint start,
    GeoPoint end,
  ) {
    final referenceLat = _radians(
      (start.latitude + end.latitude + point.latitude) / 3,
    );
    double x(GeoPoint p) =>
        _radians(p.longitude) * math.cos(referenceLat) * earthRadiusMeters;
    double y(GeoPoint p) => _radians(p.latitude) * earthRadiusMeters;
    final sx = x(start),
        sy = y(start),
        ex = x(end),
        ey = y(end),
        px = x(point),
        py = y(point);
    final dx = ex - sx, dy = ey - sy, denominator = dx * dx + dy * dy;
    final t = denominator == 0
        ? 0.0
        : (((px - sx) * dx + (py - sy) * dy) / denominator).clamp(0.0, 1.0);
    return (
      GeoPoint(
        start.latitude + (end.latitude - start.latitude) * t,
        start.longitude + (end.longitude - start.longitude) * t,
      ),
      t,
    );
  }

  static double _radians(double value) => value * math.pi / 180;
}
