import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
  const Schedule({
    required this.id,
    required this.institutionId,
    required this.label,
    required this.departureTime,
    this.expectedBusId,
    this.expectedRouteId,
    this.weekDays = 127,
    this.active = true,
  });
  final String id, institutionId, label, departureTime;
  final String? expectedBusId, expectedRouteId;
  final int weekDays;
  final bool active;
  @override
  List<Object?> get props => [
    id,
    institutionId,
    label,
    departureTime,
    expectedBusId,
    expectedRouteId,
    weekDays,
    active,
  ];
}
