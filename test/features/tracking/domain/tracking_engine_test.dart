import 'package:buskoi/core/utils/geo_geometry.dart';
import 'package:buskoi/features/buses/domain/entities/bus.dart';
import 'package:buskoi/features/routes/domain/entities/route.dart';
import 'package:buskoi/features/tracking/domain/entities/gps_sample.dart';
import 'package:buskoi/features/tracking/domain/entities/source_lease.dart';
import 'package:buskoi/features/tracking/domain/services/bus_status_engine.dart';
import 'package:buskoi/features/tracking/domain/services/direction_detector.dart';
import 'package:buskoi/features/tracking/domain/services/eta_calculator.dart';
import 'package:buskoi/features/tracking/domain/services/route_matcher.dart';
import 'package:buskoi/features/tracking/domain/services/stop_detector.dart';
import 'package:buskoi/features/wallet/domain/entities/wallet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const a = GeoPoint(22.0, 90.0),
      b = GeoPoint(22.0, 90.01),
      c = GeoPoint(22.0, 90.02),
      d = GeoPoint(22.0, 90.03);
  const route = BusRoute(
    id: 'route',
    institutionId: 'pstu',
    name: 'A-D',
    startName: 'A',
    endName: 'D',
    distanceMeters: 3090,
    points: [a, b, c, d],
    stops: [
      BusStop(id: 'a', name: 'A', position: a, order: 0, routeProgress: 0),
      BusStop(id: 'b', name: 'B', position: b, order: 1, routeProgress: 1 / 3),
      BusStop(id: 'c', name: 'C', position: c, order: 2, routeProgress: 2 / 3),
      BusStop(id: 'd', name: 'D', position: d, order: 3, routeProgress: 1),
    ],
  );
  GpsSample sample(
    double longitude,
    int second, {
    double speed = 10,
    double accuracy = 5,
  }) => GpsSample(
    latitude: 22,
    longitude: longitude,
    accuracyMeters: accuracy,
    speedMps: speed,
    heading: 90,
    timestamp: DateTime(2026, 1, 1, 8, 0, second),
  );

  group('geometry', () {
    test('haversine distance is geographically accurate', () {
      expect(GeoGeometry.haversineDistance(a, b), closeTo(1030, 15));
    });
    test('projects point and calculates route progress', () {
      final projection = GeoGeometry.nearestPointOnPolyline(
        const GeoPoint(22.001, 90.015),
        route.points,
      );
      expect(projection.distanceMeters, closeTo(111, 5));
      expect(projection.progress, closeTo(.5, .01));
    });
    test('Douglas-Peucker retains endpoints and removes straight noise', () {
      final simplified = GeoGeometry.simplify([
        a,
        const GeoPoint(22.00001, 90.005),
        b,
      ], 5);
      expect(simplified, [a, b]);
    });
  });

  group('route matching', () {
    test('confirms a consistently followed route', () {
      final matcher = RouteMatcher();
      RouteMatch result = const RouteMatch(state: RouteMatchState.unknown);
      final samples = <GpsSample>[];
      for (var i = 0; i < 7; i++) {
        samples.add(sample(90 + i * .003, i));
        result = matcher.detect(samples, const [route]);
      }
      expect(result.state, RouteMatchState.confirmed);
      expect(result.route?.id, route.id);
    });
    test('does not prematurely confirm overlapping routes', () {
      const shared = BusRoute(
        id: 'shared',
        institutionId: 'pstu',
        name: 'Shared',
        startName: 'A',
        endName: 'D',
        distanceMeters: 3090,
        points: [a, b, c, d],
      );
      final matcher = RouteMatcher();
      final result = matcher.detect(
        [sample(90.005, 0), sample(90.01, 1), sample(90.015, 2)],
        const [route, shared],
      );
      expect(result.state, isNot(RouteMatchState.confirmed));
    });
    test('rejects inaccurate GPS samples', () {
      final result = RouteMatcher().detect(
        [sample(90.0, 0, accuracy: 100), sample(90.01, 1, accuracy: 100)],
        const [route],
      );
      expect(result.state, RouteMatchState.unknown);
    });
  });

  group('direction and stops', () {
    test('detects forward and reverse with noise resistance', () {
      final detector = DirectionDetector();
      expect(detector.detect([.2, .21, .205, .24, .27]), BusDirection.forward);
      expect(detector.detect([.8, .79, .795, .75, .71]), BusDirection.reverse);
    });
    test('selects next stop in both directions', () {
      final detector = StopDetector();
      expect(
        detector.detect(route.stops, .45, BusDirection.forward).next?.name,
        'C',
      );
      expect(
        detector.detect(route.stops, .55, BusDirection.reverse).next?.name,
        'B',
      );
    });
  });

  group('ETA and status', () {
    test('calculates ETA from smoothed moving speed', () {
      final eta = EtaCalculator().calculate(
        routeDistanceMeters: 3000,
        progress: .5,
        reverse: false,
        samples: [sample(90, 0, speed: 10), sample(90.01, 1, speed: 10)],
      );
      expect(eta?.inSeconds, 150);
    });
    test('returns GPS lost for stale samples', () {
      final status = BusStatusEngine().evaluate(
        now: DateTime(2026, 1, 1, 8, 5),
        samples: [sample(90, 0)],
        hasSource: true,
        routeConfirmed: true,
        routeProgress: .5,
        direction: BusDirection.forward,
      );
      expect(status, TrackingStatus.gpsLost);
    });
    test('detects arrival near endpoint while stopped', () {
      final now = DateTime(2026, 1, 1, 8, 0, 10);
      final stopped = [
        sample(90.03, 7, speed: 0),
        sample(90.03, 8, speed: 0),
        sample(90.03, 9, speed: 0),
      ];
      expect(
        BusStatusEngine().evaluate(
          now: now,
          samples: stopped,
          hasSource: true,
          routeConfirmed: true,
          routeProgress: .99,
          direction: BusDirection.forward,
        ),
        TrackingStatus.arrived,
      );
    });
  });

  test('lease expires and allows deterministic failover', () {
    final lease = SourceLease(
      userId: 'phone-a',
      leaseExpiresAt: DateTime(2026, 1, 1, 8, 1),
      accuracyMeters: 5,
      updatedAt: DateTime(2026),
    );
    expect(lease.isExpiredAt(DateTime(2026, 1, 1, 8, 1, 1)), isTrue);
  });
  test('premium expires without renewal or mutation', () {
    final wallet = Wallet(
      userId: 'user',
      tokens: 10,
      premiumUntil: DateTime.now().subtract(const Duration(seconds: 1)),
    );
    expect(wallet.hasPremium, isFalse);
    expect(wallet.tokens, 10);
  });
}
