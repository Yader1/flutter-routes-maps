import 'dart:ui' as ui;

import 'package:dio/dio.dart';
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

Future<BitmapDescriptor> getNetworkImageMarker() async {
  final resp = await Dio().get(
    'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/map-marker-512.png',
    options: Options(responseType: ResponseType.bytes),
  );

  final imageCode = await ui.instantiateImageCodec(
    resp.data,
    targetWidth: 100,
    targetHeight: 100,
  );

  final frame = await imageCode.getNextFrame();
  final byteData = await frame.image.toByteData(format: ui.ImageByteFormat.png);

  if(byteData == null){
    return await getAssetImageMarker();
  }

  return BitmapDescriptor.bytes(byteData.buffer.asUint8List());
}