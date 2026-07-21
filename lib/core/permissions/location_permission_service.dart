import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as permissions;

enum LocationReadiness {
  ready,
  serviceDisabled,
  denied,
  deniedForever,
  backgroundDenied,
}

class LocationPermissionService {
  Future<LocationReadiness> ensureContributorPermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return LocationReadiness.serviceDisabled;
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return LocationReadiness.deniedForever;
    }
    if (permission == LocationPermission.denied) {
      return LocationReadiness.denied;
    }
    final background = await permissions.Permission.locationAlways.request();
    if (!background.isGranted) return LocationReadiness.backgroundDenied;
    await permissions.Permission.notification.request();
    return LocationReadiness.ready;
  }

  Future<void> openSettings() => permissions.openAppSettings();
  Future<void> openLocationSettings() => Geolocator.openLocationSettings();
}
