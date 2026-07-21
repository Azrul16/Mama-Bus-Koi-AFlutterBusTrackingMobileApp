import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart' hide GeoPoint;
import 'package:drift/drift.dart' hide Column;
import '../../../core/database/app_database.dart' as db;
import '../../../core/firebase/firebase_paths.dart';
import '../../../core/utils/geo_geometry.dart';
import '../domain/entities/route.dart';
import '../domain/repositories/route_repository.dart';

class RouteRepositoryImpl implements RouteRepository {
  RouteRepositoryImpl(this._database, this._firestore);
  final db.AppDatabase _database;
  final FirebaseFirestore _firestore;

  @override
  Stream<List<BusRoute>> watchRoutes(String institutionId) =>
      (_database.select(_database.routes)..where(
            (row) =>
                row.institutionId.equals(institutionId) &
                row.active.equals(true),
          ))
          .watch()
          .asyncMap((rows) async {
            final result = <BusRoute>[];
            for (final row in rows) {
              final stops =
                  await (_database.select(_database.routeStops)
                        ..where((stop) => stop.routeId.equals(row.id))
                        ..orderBy([(stop) => OrderingTerm.asc(stop.stopOrder)]))
                      .get();
              result.add(
                BusRoute(
                  id: row.id,
                  institutionId: row.institutionId,
                  name: row.name,
                  startName: row.startName,
                  endName: row.endName,
                  distanceMeters: row.distanceMeters,
                  bidirectional: row.bidirectional,
                  routeCorridorMeters: row.routeCorridorMeters,
                  active: row.active,
                  points: _decode(row.encodedPoints),
                  stops: stops
                      .map(
                        (stop) => BusStop(
                          id: stop.id,
                          name: stop.name,
                          position: GeoPoint(stop.latitude, stop.longitude),
                          order: stop.stopOrder,
                          routeProgress: stop.routeProgress,
                        ),
                      )
                      .toList(),
                ),
              );
            }
            return result;
          });

  @override
  Future<void> refresh(String institutionId) async {
    final snapshot = await _firestore
        .collection(FirebasePaths.routes(institutionId))
        .where('active', isEqualTo: true)
        .get();
    for (final doc in snapshot.docs) {
      await _cache(_fromJson(doc.id, institutionId, doc.data()));
    }
  }

  @override
  Future<void> saveRoute(BusRoute route) async {
    final normalizedStops = route.stops
        .map(
          (stop) => BusStop(
            id: stop.id,
            name: stop.name,
            position: stop.position,
            order: stop.order,
            routeProgress: GeoGeometry.progressAlongPolyline(
              stop.position,
              route.points,
            ),
          ),
        )
        .toList();
    final normalized = BusRoute(
      id: route.id,
      institutionId: route.institutionId,
      name: route.name,
      startName: route.startName,
      endName: route.endName,
      distanceMeters: GeoGeometry.polylineLength(route.points).round(),
      points: route.points,
      stops: normalizedStops,
      active: route.active,
      routeCorridorMeters: route.routeCorridorMeters,
      bidirectional: route.bidirectional,
    );
    await _firestore
        .collection(FirebasePaths.routes(route.institutionId))
        .doc(route.id)
        .set(_toJson(normalized), SetOptions(merge: true));
    await _cache(normalized);
  }

  @override
  Future<void> deactivateRoute(String institutionId, String routeId) async {
    await _firestore
        .collection(FirebasePaths.routes(institutionId))
        .doc(routeId)
        .update({'active': false, 'updatedAt': FieldValue.serverTimestamp()});
    await (_database.update(_database.routes)
          ..where((row) => row.id.equals(routeId)))
        .write(const db.RoutesCompanion(active: Value(false)));
  }

  Future<void> _cache(BusRoute route) => _database.transaction(() async {
    await _database
        .into(_database.routes)
        .insert(
          db.RoutesCompanion.insert(
            id: route.id,
            institutionId: route.institutionId,
            name: route.name,
            startName: route.startName,
            endName: route.endName,
            distanceMeters: route.distanceMeters,
            bidirectional: Value(route.bidirectional),
            routeCorridorMeters: Value(route.routeCorridorMeters),
            encodedPoints: Value(
              jsonEncode(
                route.points
                    .map((point) => [point.latitude, point.longitude])
                    .toList(),
              ),
            ),
            active: Value(route.active),
          ),
          mode: InsertMode.insertOrReplace,
        );
    await (_database.delete(
      _database.routeStops,
    )..where((row) => row.routeId.equals(route.id))).go();
    for (final stop in route.stops) {
      await _database
          .into(_database.routeStops)
          .insert(
            db.RouteStopsCompanion.insert(
              id: stop.id,
              routeId: route.id,
              name: stop.name,
              latitude: stop.position.latitude,
              longitude: stop.position.longitude,
              stopOrder: stop.order,
              routeProgress: Value(stop.routeProgress),
            ),
          );
    }
  });

  BusRoute _fromJson(
    String id,
    String institutionId,
    Map<String, dynamic> data,
  ) {
    final points = (data['polyline'] as List? ?? const [])
        .whereType<Map>()
        .map(
          (value) => GeoPoint(
            (value['latitude'] as num).toDouble(),
            (value['longitude'] as num).toDouble(),
          ),
        )
        .toList();
    final stops = (data['stops'] as List? ?? const [])
        .whereType<Map>()
        .map(
          (value) => BusStop(
            id: value['id'] as String,
            name: value['name'] as String,
            position: GeoPoint(
              (value['latitude'] as num).toDouble(),
              (value['longitude'] as num).toDouble(),
            ),
            order: (value['order'] as num).toInt(),
            routeProgress: (value['routeProgress'] as num?)?.toDouble() ?? 0,
          ),
        )
        .toList();
    return BusRoute(
      id: id,
      institutionId: institutionId,
      name: data['name'] as String? ?? 'Route',
      startName: data['startName'] as String? ?? '',
      endName: data['endName'] as String? ?? '',
      distanceMeters:
          (data['distanceMeters'] as num?)?.toInt() ??
          GeoGeometry.polylineLength(points).round(),
      points: points,
      stops: stops,
      bidirectional: data['bidirectional'] as bool? ?? true,
      routeCorridorMeters:
          (data['routeCorridorMeters'] as num?)?.toDouble() ?? 150,
      active: data['active'] as bool? ?? true,
    );
  }

  Map<String, Object?> _toJson(BusRoute route) => {
    'name': route.name,
    'startName': route.startName,
    'endName': route.endName,
    'bidirectional': route.bidirectional,
    'polyline': route.points
        .map(
          (point) => {'latitude': point.latitude, 'longitude': point.longitude},
        )
        .toList(),
    'stops': route.stops
        .map(
          (stop) => {
            'id': stop.id,
            'name': stop.name,
            'latitude': stop.position.latitude,
            'longitude': stop.position.longitude,
            'order': stop.order,
            'routeProgress': stop.routeProgress,
          },
        )
        .toList(),
    'distanceMeters': route.distanceMeters,
    'routeCorridorMeters': route.routeCorridorMeters,
    'active': route.active,
    'updatedAt': FieldValue.serverTimestamp(),
  };
  List<GeoPoint> _decode(String value) {
    if (value.isEmpty) return const [];
    return (jsonDecode(value) as List)
        .map(
          (item) => GeoPoint(
            (item[0] as num).toDouble(),
            (item[1] as num).toDouble(),
          ),
        )
        .toList();
  }
}
