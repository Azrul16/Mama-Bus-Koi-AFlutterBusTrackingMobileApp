import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import '../../features/routes/domain/entities/route.dart' as domain;

class OpenMap extends StatefulWidget {
  const OpenMap({
    super.key,
    this.route,
    this.livePoint,
    this.onTap,
    this.interactive = true,
  });
  final domain.BusRoute? route;
  final domain.GeoPoint? livePoint;
  final ValueChanged<domain.GeoPoint>? onTap;
  final bool interactive;
  @override
  State<OpenMap> createState() => _OpenMapState();
}

class _OpenMapState extends State<OpenMap> {
  MapLibreMapController? controller;
  bool styleReady = false;
  static const styleUrl = 'https://tiles.openfreemap.org/styles/liberty';
  domain.GeoPoint get center =>
      widget.livePoint ??
      (widget.route?.points.isNotEmpty == true
          ? widget.route!.points.first
          : const domain.GeoPoint(22.36, 90.33));

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: MapLibreMap(
      styleString: styleUrl,
      initialCameraPosition: CameraPosition(
        target: LatLng(center.latitude, center.longitude),
        zoom: 12,
      ),
      rotateGesturesEnabled: widget.interactive,
      scrollGesturesEnabled: widget.interactive,
      zoomGesturesEnabled: widget.interactive,
      onMapCreated: (value) => controller = value,
      onStyleLoadedCallback: () {
        styleReady = true;
        _draw();
      },
      onMapClick: widget.onTap == null
          ? null
          : (_, point) =>
                widget.onTap!(domain.GeoPoint(point.latitude, point.longitude)),
    ),
  );

  Future<void> _draw() async {
    final map = controller;
    if (!styleReady || map == null) return;
    await map.clearLines();
    await map.clearCircles();
    final route = widget.route;
    if (route != null && route.points.length > 1) {
      await map.addLine(
        LineOptions(
          geometry: route.points
              .map((point) => LatLng(point.latitude, point.longitude))
              .toList(),
          lineColor: '#087A5B',
          lineWidth: 5,
        ),
      );
      for (final stop in route.stops) {
        await map.addCircle(
          CircleOptions(
            geometry: LatLng(stop.position.latitude, stop.position.longitude),
            circleRadius: 6,
            circleColor: '#FFFFFF',
            circleStrokeColor: '#087A5B',
            circleStrokeWidth: 3,
          ),
        );
      }
    }
    final live = widget.livePoint;
    if (live != null) {
      await map.addCircle(
        CircleOptions(
          geometry: LatLng(live.latitude, live.longitude),
          circleRadius: 10,
          circleColor: '#FF7A00',
          circleStrokeColor: '#FFFFFF',
          circleStrokeWidth: 3,
        ),
      );
    }
  }

  @override
  void didUpdateWidget(covariant OpenMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (styleReady) _draw();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
