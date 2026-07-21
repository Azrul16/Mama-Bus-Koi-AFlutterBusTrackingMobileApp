import 'package:equatable/equatable.dart';

class LiveBus extends Equatable {
  const LiveBus({
    required this.busId,
    required this.latitude,
    required this.longitude,
    required this.speedKph,
    required this.heading,
    required this.routeProgress,
    required this.updatedAt,
    this.nextStop,
    this.etaSeconds,
  });
  final String busId;
  final double latitude, longitude, speedKph, heading, routeProgress;
  final String? nextStop;
  final int? etaSeconds;
  final DateTime updatedAt;
  @override
  List<Object?> get props => [
    busId,
    latitude,
    longitude,
    speedKph,
    heading,
    routeProgress,
    nextStop,
    etaSeconds,
    updatedAt,
  ];
}

class ContributionSession extends Equatable {
  const ContributionSession({
    required this.busId,
    required this.startedAt,
    this.isPrimarySource = false,
  });
  final String busId;
  final DateTime startedAt;
  final bool isPrimarySource;
  @override
  List<Object> get props => [busId, startedAt, isPrimarySource];
}
