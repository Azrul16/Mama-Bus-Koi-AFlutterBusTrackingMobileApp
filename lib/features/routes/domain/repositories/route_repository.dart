import '../entities/route.dart';

abstract interface class RouteRepository {
  Stream<List<BusRoute>> watchRoutes(String institutionId);
  Future<void> refresh(String institutionId);
  Future<void> saveRoute(BusRoute route);
  Future<void> deactivateRoute(String institutionId, String routeId);
}
