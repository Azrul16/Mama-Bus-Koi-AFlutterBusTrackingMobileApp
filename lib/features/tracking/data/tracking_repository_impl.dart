import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import '../../../core/config/tracking_config.dart';
import '../../../core/firebase/firebase_paths.dart';
import '../../../core/location/foreground_location_service.dart';
import '../../buses/domain/entities/bus.dart';
import '../../routes/domain/entities/route.dart';
import '../domain/entities/active_trip.dart';
import '../domain/entities/gps_sample.dart';
import '../domain/entities/live_bus.dart';
import '../domain/repositories/tracking_repository.dart';
import '../domain/services/bus_status_engine.dart';
import '../domain/services/direction_detector.dart';
import '../domain/services/eta_calculator.dart';
import '../domain/services/route_matcher.dart';
import '../domain/services/stop_detector.dart';

class TrackingRepositoryImpl implements TrackingRepository {
  TrackingRepositoryImpl(this._database, this._location);
  final FirebaseDatabase _database;
  final ForegroundLocationService _location;
  final _session = StreamController<ContributionSession?>.broadcast();
  final _samples = <GpsSample>[];
  final _progress = <double>[];
  final _matcher = RouteMatcher();
  final _direction = DirectionDetector();
  final _stops = StopDetector();
  final _eta = EtaCalculator();
  final _status = BusStatusEngine();
  StreamSubscription<GpsSample>? _locationSubscription;
  Timer? _heartbeat;
  String? _institutionId, _busId, _userId;
  List<BusRoute> _routes = const [];
  bool _primary = false;
  DateTime? _startedAt;
  String? _tripId;

  @override
  Stream<ContributionSession?> watchContribution() async* {
    yield _currentSession;
    yield* _session.stream;
  }

  ContributionSession? get _currentSession =>
      _busId == null || _startedAt == null
      ? null
      : ContributionSession(
          busId: _busId!,
          startedAt: _startedAt!,
          isPrimarySource: _primary,
        );

  @override
  Stream<LiveBus?> watchLiveBus(String institutionId, String busId) => _database
      .ref(FirebasePaths.busLive(institutionId, busId))
      .onValue
      .map((event) {
        final raw = event.snapshot.value;
        if (raw is! Map) return null;
        final data = Map<String, dynamic>.from(raw);
        return LiveBus(
          busId: busId,
          latitude: (data['latitude'] as num).toDouble(),
          longitude: (data['longitude'] as num).toDouble(),
          speedKph: (data['speedMps'] as num? ?? 0).toDouble() * 3.6,
          heading: (data['heading'] as num? ?? 0).toDouble(),
          routeProgress: (data['routeProgress'] as num? ?? 0).toDouble(),
          nextStop: data['nextStopId'] as String?,
          etaSeconds: (data['etaSeconds'] as num?)?.toInt(),
          updatedAt: DateTime.fromMillisecondsSinceEpoch(
            (data['updatedAt'] as num).toInt(),
          ),
        );
      });

  @override
  Future<void> startContributing({
    required String institutionId,
    required String busId,
    required String busName,
    required String userId,
    required List<BusRoute> routes,
  }) async {
    await stopContributing();
    _institutionId = institutionId;
    _busId = busId;
    _userId = userId;
    _routes = routes;
    _startedAt = DateTime.now();
    await _database.ref('contributors/$institutionId/$busId/$userId').set({
      'joinedAt': ServerValue.timestamp,
      'lastHeartbeat': ServerValue.timestamp,
      'accuracy': 999,
      'sourceState': 'STANDBY',
    });
    await _claimOrStandby();
    _heartbeat = Timer.periodic(
      TrackingConfig.leaseRenewInterval,
      (_) => _claimOrStandby(),
    );
    _locationSubscription = _location.samples
        .where(
          (sample) =>
              sample.accuracyMeters <= TrackingConfig.maxGpsAccuracyMeters,
        )
        .listen(_processSample, onError: (_) => stopContributing());
    await _location.start(busName);
    _session.add(_currentSession);
  }

  Future<void> _claimOrStandby() async {
    final institution = _institutionId, bus = _busId, user = _userId;
    if (institution == null || bus == null || user == null) return;
    final offsetSnapshot = await _database.ref('.info/serverTimeOffset').get();
    final now =
        DateTime.now().millisecondsSinceEpoch +
        ((offsetSnapshot.value as num?)?.toInt() ?? 0);
    final leaseRef = _database.ref('source_leases/$institution/$bus');
    final result = await leaseRef.runTransaction((value) {
      final existing = value is Map
          ? Map<String, dynamic>.from(value)
          : <String, dynamic>{};
      final owner = existing['userId'] as String?;
      final expiry = (existing['leaseExpiresAt'] as num?)?.toInt() ?? 0;
      if (owner == user || expiry <= now) {
        return Transaction.success({
          'userId': user,
          'leaseExpiresAt': now + TrackingConfig.leaseDuration.inMilliseconds,
          'accuracy': _samples.isEmpty ? 999 : _samples.last.accuracyMeters,
          'updatedAt': now,
        });
      }
      return Transaction.success(value);
    });
    final value = result.snapshot.value;
    final isPrimary = value is Map && value['userId'] == user;
    if (_primary != isPrimary) {
      _primary = isPrimary;
      _session.add(_currentSession);
    }
    if (isPrimary &&
        _samples.isNotEmpty &&
        DateTime.now().difference(_samples.last.timestamp) >=
            TrackingConfig.gpsLost) {
      await _database.ref(FirebasePaths.busStatus(institution, bus)).update({
        'isLive': true,
        'status': 'GPS_LOST',
        'updatedAt': ServerValue.timestamp,
      });
    }
    await _database.ref('contributors/$institution/$bus/$user').update({
      'lastHeartbeat': ServerValue.timestamp,
      'accuracy': _samples.isEmpty ? 999 : _samples.last.accuracyMeters,
      'sourceState': isPrimary ? 'PRIMARY' : 'STANDBY',
    });
  }

  Future<void> _processSample(GpsSample sample) async {
    _samples.add(sample);
    if (_samples.length > 10) _samples.removeAt(0);
    if (!_primary) return;
    final match = _matcher.detect(_samples, _routes);
    if (match.route != null) {
      _progress.add(match.progress);
      if (_progress.length > 8) _progress.removeAt(0);
    }
    final direction = _direction.detect(_progress);
    final stopInfo = match.route == null
        ? const StopInfo()
        : _stops.detect(match.route!.stops, match.progress, direction);
    final eta = match.route == null
        ? null
        : _eta.calculate(
            routeDistanceMeters: match.route!.distanceMeters.toDouble(),
            progress: match.progress,
            reverse: direction == BusDirection.reverse,
            samples: _samples,
          );
    final status = _status.evaluate(
      now: DateTime.now(),
      samples: _samples,
      hasSource: true,
      routeConfirmed: match.state == RouteMatchState.confirmed,
      routeProgress: match.progress,
      direction: direction,
    );
    final institution = _institutionId!, bus = _busId!;
    final updates = <String, Object?>{
      FirebasePaths.busStatus(institution, bus): {
        'isLive': true,
        'status': status.name.toUpperCase(),
        'detectedRouteId': match.route?.id,
        'direction': direction.name.toUpperCase(),
        'nearestStopName': stopInfo.nearest?.name,
        'confidence': match.confidence >= .8
            ? 'HIGH'
            : match.confidence >= .6
            ? 'MEDIUM'
            : 'LOW',
        'updatedAt': ServerValue.timestamp,
      },
      FirebasePaths.busLive(institution, bus): {
        'latitude': sample.latitude,
        'longitude': sample.longitude,
        'speedMps': sample.speedMps,
        'heading': sample.heading,
        'routeProgress': match.progress,
        'nextStopId': stopInfo.next?.id,
        'etaSeconds': eta?.inSeconds,
        'updatedAt': ServerValue.timestamp,
      },
    };
    if (match.state == RouteMatchState.confirmed &&
        (status == TrackingStatus.moving || status == TrackingStatus.stopped)) {
      _tripId ??= const Uuid().v4();
      updates['active_trips/$institution/$bus'] = _tripJson(
        ActiveTrip(
          tripId: _tripId!,
          busId: bus,
          detectedRouteId: match.route!.id,
          direction: direction,
          status: status,
          startedAt: _startedAt!,
          routeConfidence: match.confidence,
          gpsConfidence:
              (1 - sample.accuracyMeters / TrackingConfig.maxGpsAccuracyMeters)
                  .clamp(0, 1),
        ),
      );
    }
    if (status == TrackingStatus.arrived && _tripId != null) {
      updates['trip_history/$institution/$_tripId'] = {
        'tripId': _tripId,
        'busId': bus,
        'detectedRouteId': match.route?.id,
        'directionAtStart': direction.name.toUpperCase(),
        'startedAt': _startedAt?.millisecondsSinceEpoch,
        'endedAt': ServerValue.timestamp,
        'estimatedDistanceMeters': match.route?.distanceMeters,
        'status': 'COMPLETED',
      };
      updates['active_trips/$institution/$bus'] = null;
    }
    await _database.ref().update(updates);
  }

  Map<String, Object?> _tripJson(ActiveTrip trip) => {
    'tripId': trip.tripId,
    'busId': trip.busId,
    'detectedRouteId': trip.detectedRouteId,
    'direction': trip.direction.name.toUpperCase(),
    'status': trip.status.name.toUpperCase(),
    'startedAt': trip.startedAt.millisecondsSinceEpoch,
    'routeConfidence': trip.routeConfidence,
    'gpsConfidence': trip.gpsConfidence,
  };

  @override
  Future<void> stopContributing() async {
    _heartbeat?.cancel();
    _heartbeat = null;
    await _locationSubscription?.cancel();
    _locationSubscription = null;
    final institution = _institutionId, bus = _busId, user = _userId;
    if (institution != null && bus != null && user != null) {
      final summaryId = const Uuid().v4();
      await _database
          .ref('contribution_summaries/$institution/$summaryId')
          .set({
            'userId': user,
            'busId': bus,
            'tripId': _tripId,
            'durationSeconds': _startedAt == null
                ? 0
                : DateTime.now().difference(_startedAt!).inSeconds,
            'wasPrimary': _primary,
            'status': 'PENDING',
            'createdAt': ServerValue.timestamp,
          });
      await _database.ref('contributors/$institution/$bus/$user').remove();
      if (_primary) {
        final lease = _database.ref('source_leases/$institution/$bus');
        await lease.runTransaction((value) {
          if (value is Map && value['userId'] == user) {
            return Transaction.success(null);
          }
          return Transaction.success(value);
        });
      }
    }
    await _location.stop();
    _primary = false;
    _institutionId = null;
    _busId = null;
    _userId = null;
    _startedAt = null;
    _tripId = null;
    _routes = const [];
    _samples.clear();
    _progress.clear();
    _matcher.reset();
    _session.add(null);
  }
}
