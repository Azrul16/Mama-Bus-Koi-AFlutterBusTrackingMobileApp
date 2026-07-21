import 'dart:math' as math;
import 'package:firebase_database/firebase_database.dart';
import '../../../core/firebase/firebase_paths.dart';
import '../../../core/utils/geo_geometry.dart';
import '../../routes/domain/entities/route.dart';

class DebugGpsSimulator {
  DebugGpsSimulator(this._database);
  final FirebaseDatabase _database;
  Future<void> emit({
    required String institutionId,
    required String busId,
    required BusRoute route,
    required double progress,
    bool reverse = false,
    bool stopped = false,
    bool lost = false,
    double noiseMeters = 0,
  }) async {
    if (lost) {
      await _database
          .ref(FirebasePaths.busStatus(institutionId, busId))
          .update({
            'status': 'GPS_LOST',
            'isLive': true,
            'updatedAt': DateTime.now()
                .subtract(const Duration(minutes: 3))
                .millisecondsSinceEpoch,
          });
      return;
    }
    final base = GeoGeometry.interpolate(route.points, progress);
    final random = math.Random();
    final latitude =
        base.latitude + (random.nextDouble() - .5) * noiseMeters / 111320;
    final longitude =
        base.longitude +
        (random.nextDouble() - .5) *
            noiseMeters /
            (111320 * math.cos(base.latitude * math.pi / 180));
    await _database.ref().update({
      FirebasePaths.busStatus(institutionId, busId): {
        'isLive': true,
        'status': stopped ? 'STOPPED' : 'MOVING',
        'detectedRouteId': route.id,
        'direction': reverse ? 'REVERSE' : 'FORWARD',
        'nearestStopName': route.stops.isEmpty
            ? null
            : route.stops
                  .reduce(
                    (a, b) =>
                        (a.routeProgress - progress).abs() <
                            (b.routeProgress - progress).abs()
                        ? a
                        : b,
                  )
                  .name,
        'confidence': 'HIGH',
        'updatedAt': ServerValue.timestamp,
      },
      FirebasePaths.busLive(institutionId, busId): {
        'latitude': latitude,
        'longitude': longitude,
        'speedMps': stopped ? 0 : 10,
        'heading': reverse ? 180 : 0,
        'routeProgress': progress,
        'updatedAt': ServerValue.timestamp,
      },
    });
  }

  Future<void> offline(String institutionId, String busId) =>
      _database.ref(FirebasePaths.busStatus(institutionId, busId)).set({
        'isLive': false,
        'status': 'OFFLINE',
        'updatedAt': ServerValue.timestamp,
      });
}
