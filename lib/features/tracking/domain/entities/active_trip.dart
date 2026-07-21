import 'package:equatable/equatable.dart';
import '../../../buses/domain/entities/bus.dart';

class ActiveTrip extends Equatable {
  const ActiveTrip({
    required this.tripId,
    required this.busId,
    required this.detectedRouteId,
    required this.direction,
    required this.status,
    required this.startedAt,
    required this.routeConfidence,
    required this.gpsConfidence,
  });
  final String tripId, busId, detectedRouteId;
  final BusDirection direction;
  final TrackingStatus status;
  final DateTime startedAt;
  final double routeConfidence, gpsConfidence;
  @override
  List<Object> get props => [
    tripId,
    busId,
    detectedRouteId,
    direction,
    status,
    startedAt,
    routeConfidence,
    gpsConfidence,
  ];
}
