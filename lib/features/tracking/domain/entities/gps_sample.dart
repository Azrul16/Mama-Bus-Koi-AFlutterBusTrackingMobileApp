import 'package:equatable/equatable.dart';
import '../../../routes/domain/entities/route.dart';

class GpsSample extends Equatable {
  const GpsSample({
    required this.latitude,
    required this.longitude,
    required this.accuracyMeters,
    required this.speedMps,
    required this.heading,
    required this.timestamp,
  });
  final double latitude, longitude, accuracyMeters, speedMps, heading;
  final DateTime timestamp;
  GeoPoint get point => GeoPoint(latitude, longitude);
  @override
  List<Object> get props => [
    latitude,
    longitude,
    accuracyMeters,
    speedMps,
    heading,
    timestamp,
  ];
}
