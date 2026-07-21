import 'package:equatable/equatable.dart';

enum BusDirection { forward, reverse, unknown }

enum TrackingStatus { offline, detecting, moving, stopped, arrived, gpsLost }

class Bus extends Equatable {
  const Bus({
    required this.id,
    required this.institutionId,
    required this.name,
    required this.busNumber,
    required this.colorValue,
    this.capacity,
    this.plateNumber,
    this.description,
    this.active = true,
  });
  final String id, institutionId, name, busNumber;
  final int colorValue;
  final int? capacity;
  final String? plateNumber, description;
  final bool active;
  @override
  List<Object?> get props => [
    id,
    institutionId,
    name,
    busNumber,
    colorValue,
    capacity,
    plateNumber,
    description,
    active,
  ];
}

class PublicBusStatus extends Equatable {
  const PublicBusStatus({
    required this.busId,
    required this.status,
    required this.direction,
    required this.updatedAt,
    this.detectedRouteId,
    this.nearestStop,
    this.confidence = 'LOW',
  });
  final String busId;
  final TrackingStatus status;
  final BusDirection direction;
  final DateTime updatedAt;
  final String? detectedRouteId, nearestStop;
  final String confidence;
  bool get isLive =>
      status != TrackingStatus.offline && status != TrackingStatus.gpsLost;
  @override
  List<Object?> get props => [
    busId,
    status,
    direction,
    updatedAt,
    detectedRouteId,
    nearestStop,
    confidence,
  ];
}

class BusWithStatus extends Equatable {
  const BusWithStatus(this.bus, this.status);
  final Bus bus;
  final PublicBusStatus? status;
  @override
  List<Object?> get props => [bus, status];
}
