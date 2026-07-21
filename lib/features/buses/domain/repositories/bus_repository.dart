import '../entities/bus.dart';

abstract interface class BusRepository {
  Stream<List<BusWithStatus>> watchBuses(String institutionId);
  Future<void> refresh(String institutionId);
  Future<void> saveBus(Bus bus);
  Future<void> deactivateBus(String institutionId, String busId);
  Future<void> deleteBus(String institutionId, String busId);
}
