import 'dart:ui' as ui;

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../markers/markers.dart';

Future<BitmapDescriptor> getStartCustomMarker(int minutes, String destination) async {
    final recoder = ui.PictureRecorder();
    final canvas = ui.Canvas(recoder);
    const size = ui.Size(350, 150);

    final startMarker = StartMarkerPainter(minutes: minutes, destination: destination);
    startMarker.paint(canvas, size);

    final pinture = recoder.endRecording();
    final image = await pinture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getEndCustomMarker(int kms, String destination) async {
    final recoder = ui.PictureRecorder();
    final canvas = ui.Canvas(recoder);
    const size = ui.Size(350, 150);

    final endMarker = EndMarkerPainter(kms: kms, destination: destination);
    endMarker.paint(canvas, size);

    final pinture = recoder.endRecording();
    final image = await pinture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
}