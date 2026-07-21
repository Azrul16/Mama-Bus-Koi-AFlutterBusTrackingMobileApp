import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/route.dart';
import '../../domain/repositories/route_repository.dart';

class RoutesCubit extends Cubit<List<BusRoute>> {
  RoutesCubit(this._repository) : super(const []);
  final RouteRepository _repository;
  StreamSubscription? _subscription;
  String? institutionId;
  Future<void> start(String scope) async {
    if (scope == institutionId && _subscription != null) return;
    institutionId = scope;
    await _subscription?.cancel();
    _subscription = _repository.watchRoutes(scope).listen(emit);
    try {
      await _repository.refresh(scope);
    } catch (_) {}
  }

  Future<void> save(BusRoute route) => _repository.saveRoute(route);
  Future<void> deactivate(String id) async {
    final scope = institutionId;
    if (scope != null) await _repository.deactivateRoute(scope, id);
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
