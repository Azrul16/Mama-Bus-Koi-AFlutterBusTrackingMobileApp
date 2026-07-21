import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/bus.dart';
import '../../domain/repositories/bus_repository.dart';

sealed class BusesEvent extends Equatable {
  const BusesEvent();
  @override
  List<Object?> get props => [];
}

final class BusesStarted extends BusesEvent {
  const BusesStarted();
}

final class BusesRefreshed extends BusesEvent {
  const BusesRefreshed();
}

final class BusesInstitutionChanged extends BusesEvent {
  const BusesInstitutionChanged(this.institutionId);
  final String institutionId;
  @override
  List<Object> get props => [institutionId];
}

final class BusesQueryChanged extends BusesEvent {
  const BusesQueryChanged(this.query);
  final String query;
  @override
  List<Object> get props => [query];
}

final class _BusesReceived extends BusesEvent {
  const _BusesReceived(this.buses);
  final List<BusWithStatus> buses;
  @override
  List<Object> get props => [buses];
}

enum BusesLoadStatus { initial, loading, success, failure }

class BusesState extends Equatable {
  const BusesState({
    this.status = BusesLoadStatus.initial,
    this.buses = const [],
    this.query = '',
    this.error,
  });
  final BusesLoadStatus status;
  final List<BusWithStatus> buses;
  final String query;
  final String? error;
  List<BusWithStatus> get visibleBuses => query.isEmpty
      ? buses
      : buses
            .where(
              (item) =>
                  item.bus.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
  BusesState copyWith({
    BusesLoadStatus? status,
    List<BusWithStatus>? buses,
    String? query,
    String? error,
  }) => BusesState(
    status: status ?? this.status,
    buses: buses ?? this.buses,
    query: query ?? this.query,
    error: error,
  );
  @override
  List<Object?> get props => [status, buses, query, error];
}

class BusesBloc extends Bloc<BusesEvent, BusesState> {
  BusesBloc(this._repository) : super(const BusesState()) {
    on<BusesStarted>(_onStarted);
    on<BusesRefreshed>(_onRefreshed);
    on<BusesInstitutionChanged>(_onInstitutionChanged);
    on<BusesQueryChanged>(
      (event, emit) => emit(state.copyWith(query: event.query)),
    );
    on<_BusesReceived>(
      (event, emit) => emit(
        state.copyWith(status: BusesLoadStatus.success, buses: event.buses),
      ),
    );
  }
  final BusRepository _repository;
  String? institutionId;
  StreamSubscription? _subscription;
  Future<void> _onStarted(BusesStarted event, Emitter<BusesState> emit) async {
    final scope = institutionId;
    if (scope == null) return;
    emit(state.copyWith(status: BusesLoadStatus.loading));
    await _subscription?.cancel();
    _subscription = _repository
        .watchBuses(scope)
        .listen(
          (items) => add(_BusesReceived(items)),
          onError: (Object error) => addError(error),
        );
    try {
      await _repository.refresh(scope);
    } catch (_) {
      /* Offline cache remains authoritative. */
    }
  }

  Future<void> _onRefreshed(
    BusesRefreshed event,
    Emitter<BusesState> emit,
  ) async {
    try {
      final scope = institutionId;
      if (scope != null) await _repository.refresh(scope);
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
    }
  }

  void _onInstitutionChanged(
    BusesInstitutionChanged event,
    Emitter<BusesState> emit,
  ) {
    if (institutionId == event.institutionId &&
        state.status != BusesLoadStatus.initial) {
      return;
    }
    institutionId = event.institutionId;
    add(const BusesStarted());
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
