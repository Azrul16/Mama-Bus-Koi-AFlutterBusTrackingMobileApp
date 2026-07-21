abstract final class TrackingConfig {
  static const maxGpsAccuracyMeters = 60.0;
  static const routeCorridorMeters = 150.0;
  static const routeConfirmationSamples = 5;
  static const routeSwitchImprovementRatio = 0.65;
  static const directionMinProgressDelta = 0.015;
  static const stoppedSpeedMps = 1.2;
  static const movingInterval = Duration(seconds: 9);
  static const slowInterval = Duration(seconds: 15);
  static const stoppedInterval = Duration(seconds: 28);
  static const leaseDuration = Duration(seconds: 60);
  static const leaseRenewInterval = Duration(seconds: 20);
  static const contributorHeartbeatInterval = Duration(seconds: 20);
  static const freshGps = Duration(seconds: 30);
  static const delayedGps = Duration(seconds: 90);
  static const gpsLost = Duration(seconds: 120);
  static const stoppedDuration = Duration(seconds: 90);
  static const arrivalRadiusMeters = 120.0;
  static const minimumEtaSpeedMps = 2.0;
}
