import 'package:equatable/equatable.dart';

class GeoPoint extends Equatable {
  const GeoPoint(this.latitude, this.longitude);
  final double latitude, longitude;
  @override
  List<Object> get props => [latitude, longitude];
}

class BusStop extends Equatable {
  const BusStop({
    required this.id,
    required this.name,
    required this.position,
    required this.order,
    this.routeProgress = 0,
  });
  final String id, name;
  final GeoPoint position;
  final int order;
  final double routeProgress;
  @override
  List<Object> get props => [id, name, position, order, routeProgress];
}

class BusRoute extends Equatable {
  const BusRoute({
    required this.id,
    required this.institutionId,
    required this.name,
    required this.startName,
    required this.endName,
    required this.distanceMeters,
    this.points = const [],
    this.stops = const [],
    this.active = true,
    this.routeCorridorMeters = 150,
    this.bidirectional = true,
  });
  final String id, institutionId, name, startName, endName;
  final int distanceMeters;
  final List<GeoPoint> points;
  final List<BusStop> stops;
  final bool active;
  final double routeCorridorMeters;
  final bool bidirectional;
  @override
  List<Object> get props => [
    id,
    institutionId,
    name,
    startName,
    endName,
    distanceMeters,
    points,
    stops,
    active,
    routeCorridorMeters,
    bidirectional,
  ];
}
