import 'package:flutter/material.dart' show ImageConfiguration;
import 'package:google_maps_flutter/google_maps_flutter.dart' show BitmapDescriptor;

Future<BitmapDescriptor> getAssetImageMarker() async {
  return BitmapDescriptor.asset(
    const ImageConfiguration(
      devicePixelRatio: 2.5,
    ),
    'assets/destination_map_marker.png',
  );
}