import 'package:equatable/equatable.dart';

enum SourceState { primary, standby }

class SourceLease extends Equatable {
  const SourceLease({
    required this.userId,
    required this.leaseExpiresAt,
    required this.accuracyMeters,
    required this.updatedAt,
  });
  final String userId;
  final DateTime leaseExpiresAt, updatedAt;
  final double accuracyMeters;
  bool isExpiredAt(DateTime time) => !leaseExpiresAt.isAfter(time);
  @override
  List<Object> get props => [userId, leaseExpiresAt, accuracyMeters, updatedAt];
}
