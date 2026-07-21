import 'dart:async';
import 'package:flutter/services.dart';
import '../../features/tracking/domain/entities/gps_sample.dart';

class ForegroundLocationService {
  static const _methods = MethodChannel('mama_bus_koi/location');
  static const _events = EventChannel('mama_bus_koi/location_stream');
  Stream<GpsSample>? _stream;
  Stream<GpsSample> get samples =>
      _stream ??= _events.receiveBroadcastStream().map((raw) {
        final value = Map<Object?, Object?>.from(raw as Map);
        return GpsSample(
          latitude: (value['latitude'] as num).toDouble(),
          longitude: (value['longitude'] as num).toDouble(),
          accuracyMeters: (value['accuracy'] as num).toDouble(),
          speedMps: (value['speed'] as num).toDouble(),
          heading: (value['heading'] as num).toDouble(),
          timestamp: DateTime.fromMillisecondsSinceEpoch(
            (value['timestamp'] as num).toInt(),
          ),
        );
      }).asBroadcastStream();
  Future<void> start(String busName) =>
      _methods.invokeMethod('start', {'busName': busName});
  Future<void> stop() => _methods.invokeMethod('stop');
}
