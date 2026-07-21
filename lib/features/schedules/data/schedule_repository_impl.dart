import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart' hide Column;

import '../../../core/database/app_database.dart' as db;
import '../../../core/firebase/firebase_paths.dart';
import '../domain/entities/schedule.dart';
import '../domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this._database, this._firestore);
  final db.AppDatabase _database;
  final FirebaseFirestore _firestore;

  @override
  Stream<List<Schedule>> watchSchedules(String institutionId) => _database
      .watchSchedules(institutionId)
      .map(
        (rows) => rows
            .map(
              (row) => Schedule(
                id: row.id,
                institutionId: row.institutionId,
                label: row.label,
                departureTime: row.departureTime,
                expectedBusId: row.expectedBusId,
                expectedRouteId: row.expectedRouteId,
                weekDays: row.weekDays,
                active: row.active,
              ),
            )
            .toList(),
      );

  @override
  Future<void> refresh(String institutionId) async {
    final result = await _firestore
        .collection(FirebasePaths.schedules(institutionId))
        .where('active', isEqualTo: true)
        .get();
    for (final doc in result.docs) {
      final value = doc.data();
      await _database
          .into(_database.busSchedules)
          .insert(
            db.BusSchedulesCompanion.insert(
              id: doc.id,
              institutionId: institutionId,
              label: value['label'] as String? ?? 'Service',
              departureTime: value['departureTime'] as String? ?? '',
              expectedBusId: Value(value['expectedBusId'] as String?),
              expectedRouteId: Value(value['expectedRouteId'] as String?),
            ),
            mode: InsertMode.insertOrReplace,
          );
    }
  }

  @override
  Future<void> saveSchedule(Schedule schedule) async {
    final data = {
      'label': schedule.label,
      'departureTime': schedule.departureTime,
      'expectedBusId': schedule.expectedBusId,
      'expectedRouteId': schedule.expectedRouteId,
      'weekDays': schedule.weekDays,
      'active': schedule.active,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    await _firestore
        .collection(FirebasePaths.schedules(schedule.institutionId))
        .doc(schedule.id)
        .set(data, SetOptions(merge: true));
    await _database
        .into(_database.busSchedules)
        .insert(
          db.BusSchedulesCompanion.insert(
            id: schedule.id,
            institutionId: schedule.institutionId,
            label: schedule.label,
            departureTime: schedule.departureTime,
            expectedBusId: Value(schedule.expectedBusId),
            expectedRouteId: Value(schedule.expectedRouteId),
            weekDays: Value(schedule.weekDays),
            active: Value(schedule.active),
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<void> deactivateSchedule(
    String institutionId,
    String scheduleId,
  ) async {
    await _firestore
        .collection(FirebasePaths.schedules(institutionId))
        .doc(scheduleId)
        .update({'active': false});
    await (_database.update(_database.busSchedules)
          ..where((row) => row.id.equals(scheduleId)))
        .write(const db.BusSchedulesCompanion(active: Value(false)));
  }
}
