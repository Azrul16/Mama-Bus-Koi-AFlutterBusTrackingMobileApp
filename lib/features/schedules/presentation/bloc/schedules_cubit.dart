import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/schedule.dart';
import '../../domain/repositories/schedule_repository.dart';

class SchedulesCubit extends Cubit<List<Schedule>> {
  SchedulesCubit(this._repository) : super(const []);
  final ScheduleRepository _repository;
  String? institutionId;
  StreamSubscription? _subscription;
  Future<void> start(String scope) async {
    if (institutionId == scope && _subscription != null) return;
    institutionId = scope;
    await _subscription?.cancel();
    _subscription = _repository.watchSchedules(scope).listen(emit);
    try {
      await _repository.refresh(scope);
    } catch (_) {
      /* Use offline schedules. */
    }
  }

  Future<void> save(Schedule schedule) => _repository.saveSchedule(schedule);
  Future<void> deactivate(String id) async {
    final scope = institutionId;
    if (scope != null) await _repository.deactivateSchedule(scope, id);
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
