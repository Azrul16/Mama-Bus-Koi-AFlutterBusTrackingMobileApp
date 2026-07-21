import '../entities/schedule.dart';

abstract interface class ScheduleRepository {
  Stream<List<Schedule>> watchSchedules(String institutionId);
  Future<void> refresh(String institutionId);
  Future<void> saveSchedule(Schedule schedule);
  Future<void> deactivateSchedule(String institutionId, String scheduleId);
}
