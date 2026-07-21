import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/permissions/location_permission_service.dart';
import '../../../routes/domain/entities/route.dart';
import '../../domain/entities/live_bus.dart';
import '../../domain/repositories/tracking_repository.dart';

class ContributorState extends Equatable {
  const ContributorState({this.session, this.starting = false, this.error});
  final ContributionSession? session;
  final bool starting;
  final String? error;
  @override
  List<Object?> get props => [session, starting, error];
}

class ContributorCubit extends Cubit<ContributorState> {
  ContributorCubit(this._repository, this._permissions)
    : super(const ContributorState()) {
    _subscription = _repository.watchContribution().listen(
      (session) => emit(ContributorState(session: session)),
    );
  }
  final TrackingRepository _repository;
  final LocationPermissionService _permissions;
  StreamSubscription? _subscription;
  Future<bool> start({
    required String institutionId,
    required String busId,
    required String busName,
    required String userId,
    required List<BusRoute> routes,
  }) async {
    emit(ContributorState(session: state.session, starting: true));
    final readiness = await _permissions.ensureContributorPermission();
    if (readiness != LocationReadiness.ready) {
      emit(ContributorState(error: _message(readiness)));
      return false;
    }
    try {
      await _repository.startContributing(
        institutionId: institutionId,
        busId: busId,
        busName: busName,
        userId: userId,
        routes: routes,
      );
      return true;
    } catch (error) {
      emit(ContributorState(error: error.toString()));
      return false;
    }
  }

  Future<void> stop() => _repository.stopContributing();
  String _message(LocationReadiness value) => switch (value) {
    LocationReadiness.serviceDisabled =>
      'Turn on location services to contribute.',
    LocationReadiness.denied => 'Location permission was denied.',
    LocationReadiness.deniedForever =>
      'Location permission is permanently denied. Open app settings.',
    LocationReadiness.backgroundDenied =>
      'Allow background location so tracking continues with the screen locked.',
    LocationReadiness.ready => '',
  };
  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
