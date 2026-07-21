import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:firebase_database/firebase_database.dart';

import '../../../core/database/app_database.dart' as db;
import '../../../core/firebase/firebase_paths.dart';
import '../domain/entities/bus.dart';
import '../domain/repositories/bus_repository.dart';

class BusRepositoryImpl implements BusRepository {
  BusRepositoryImpl(this._database, this._firestore, this._realtime);
  final db.AppDatabase _database;
  final FirebaseFirestore _firestore;
  final FirebaseDatabase _realtime;

  @override
  Stream<List<BusWithStatus>> watchBuses(String institutionId) {
    final controller = StreamController<List<BusWithStatus>>();
    StreamSubscription? busSub;
    final statusSubs = <StreamSubscription>[];

    busSub = _database.watchBuses(institutionId).listen((rows) async {
      for (final sub in statusSubs) {
        await sub.cancel();
      }
      statusSubs.clear();
      final statuses = <String, PublicBusStatus?>{};
      void emit() => controller.add(
        rows
            .map((row) => BusWithStatus(_mapBus(row), statuses[row.id]))
            .toList(),
      );
      emit();
      for (final row in rows) {
        final sub = _realtime
            .ref('bus_status/$institutionId/${row.id}')
            .onValue
            .listen((event) {
              statuses[row.id] = _mapStatus(row.id, event.snapshot.value);
              emit();
            });
        statusSubs.add(sub);
      }
    }, onError: controller.addError);
    controller.onCancel = () async {
      await busSub?.cancel();
      for (final sub in statusSubs) {
        await sub.cancel();
      }
    };
    return controller.stream;
  }

  @override
  Future<void> refresh(String institutionId) async {
    final snapshot = await _firestore
        .collection(FirebasePaths.buses(institutionId))
        .where('active', isEqualTo: true)
        .get();
    if (snapshot.docs.isEmpty) return;
    await _database.batch((batch) {
      for (final doc in snapshot.docs) {
        final data = doc.data();
        batch.insert(
          _database.buses,
          db.BusesCompanion.insert(
            id: doc.id,
            institutionId: institutionId,
            name: data['name'] as String? ?? 'Unnamed bus',
            busNumber: data['busNumber'] as String? ?? '',
            plateNumber: Value(data['plateNumber'] as String?),
            description: Value(data['description'] as String?),
            colorValue: (data['colorValue'] as num?)?.toInt() ?? 0xFF087A5B,
            capacity: Value((data['capacity'] as num?)?.toInt()),
            active: Value(data['active'] as bool? ?? true),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Bus _mapBus(db.BusRow row) => Bus(
    id: row.id,
    institutionId: row.institutionId,
    name: row.name,
    busNumber: row.busNumber,
    colorValue: row.colorValue,
    capacity: row.capacity,
    active: row.active,
    plateNumber: row.plateNumber,
    description: row.description,
  );

  @override
  Future<void> saveBus(Bus bus) async {
    final data = <String, Object?>{
      'name': bus.name,
      'busNumber': bus.busNumber,
      'plateNumber': bus.plateNumber,
      'description': bus.description,
      'capacity': bus.capacity,
      'colorValue': bus.colorValue,
      'active': bus.active,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    await _firestore
        .collection(FirebasePaths.buses(bus.institutionId))
        .doc(bus.id)
        .set({
          ...data,
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
    await _database
        .into(_database.buses)
        .insert(
          db.BusesCompanion.insert(
            id: bus.id,
            institutionId: bus.institutionId,
            name: bus.name,
            busNumber: bus.busNumber,
            colorValue: bus.colorValue,
            plateNumber: Value(bus.plateNumber),
            description: Value(bus.description),
            capacity: Value(bus.capacity),
            active: Value(bus.active),
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<void> deactivateBus(String institutionId, String busId) async {
    await _firestore
        .collection(FirebasePaths.buses(institutionId))
        .doc(busId)
        .update({'active': false, 'updatedAt': FieldValue.serverTimestamp()});
    await (_database.update(_database.buses)
          ..where((row) => row.id.equals(busId)))
        .write(const db.BusesCompanion(active: Value(false)));
  }

  @override
  Future<void> deleteBus(String institutionId, String busId) async {
    final active = await _realtime
        .ref(FirebasePaths.busStatus(institutionId, busId))
        .get();
    if (active.child('isLive').value == true) {
      throw StateError('A live bus cannot be deleted. Deactivate it instead.');
    }
    await _firestore
        .collection(FirebasePaths.buses(institutionId))
        .doc(busId)
        .delete();
    await (_database.delete(
      _database.buses,
    )..where((row) => row.id.equals(busId))).go();
  }

  PublicBusStatus? _mapStatus(String id, Object? raw) {
    if (raw is! Map) return null;
    final data = Map<String, dynamic>.from(raw);
    final direction = switch (data['direction']) {
      'FORWARD' => BusDirection.forward,
      'REVERSE' => BusDirection.reverse,
      _ => BusDirection.unknown,
    };
    final updatedAt = DateTime.fromMillisecondsSinceEpoch(
      ((data['updatedAt'] as num?)?.toInt() ?? 0) *
          ((data['updatedAt'] as num? ?? 0) < 100000000000 ? 1000 : 1),
    );
    final status = switch (data['status']) {
      'DETECTING' => TrackingStatus.detecting,
      'STOPPED' => TrackingStatus.stopped,
      'ARRIVED' => TrackingStatus.arrived,
      'GPS_LOST' => TrackingStatus.gpsLost,
      'MOVING' => TrackingStatus.moving,
      _ =>
        data['isLive'] == true
            ? TrackingStatus.detecting
            : TrackingStatus.offline,
    };
    return PublicBusStatus(
      busId: id,
      status: DateTime.now().difference(updatedAt) > const Duration(minutes: 2)
          ? TrackingStatus.gpsLost
          : status,
      direction: direction,
      updatedAt: updatedAt,
      detectedRouteId: data['detectedRouteId'] as String?,
      nearestStop: data['nearestStop'] as String?,
      confidence: data['confidence'] as String? ?? 'LOW',
    );
  }
}
