import 'package:equatable/equatable.dart';

class ContributionSummary extends Equatable {
  const ContributionSummary({
    required this.id,
    required this.institutionId,
    required this.userId,
    required this.busId,
    required this.durationSeconds,
    required this.wasPrimary,
    required this.status,
    this.tripId,
  });
  final String id, institutionId, userId, busId, status;
  final String? tripId;
  final int durationSeconds;
  final bool wasPrimary;
  @override
  List<Object?> get props => [
    id,
    institutionId,
    userId,
    busId,
    tripId,
    durationSeconds,
    wasPrimary,
    status,
  ];
}
