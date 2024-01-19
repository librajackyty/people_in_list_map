import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CusMap extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;

  CusMap(this.initialCameraPosition, this.markers, {Key? key})
      : super(key: key);

  @override
  _CusMapState createState() => _CusMapState();
}

class _CusMapState extends State<CusMap> {
  _CusMapState();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: widget.initialCameraPosition,
        markers: widget.markers);
  }
}
