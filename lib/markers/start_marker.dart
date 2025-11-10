import 'package:flutter/material.dart';

class StartMarkerPainter extends CustomPainter {
  final int minutes;
  final String destination;

  StartMarkerPainter({
    required this.minutes,
    required this.destination
  });

  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()
      ..color = Colors.black;
    
    final whitePaint = Paint()
      ..color = Colors.white;

    const double circleBlackRadius = 20.0;
    const double circleWhiteRadius = 7.0;

    canvas.drawCircle(
      Offset(
        circleBlackRadius, 
        size.height - circleBlackRadius
      ), 
      circleBlackRadius, 
      blackPaint
    );

    canvas.drawCircle(
      Offset(
        circleBlackRadius, 
        size.height - circleWhiteRadius
      ), 
      circleWhiteRadius, 
      whitePaint
    );

    final path = Path();
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(40, 100);

    canvas.drawShadow(path, Colors.black, 10, false);
    canvas.drawPath(path, whitePaint);

    const blackBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(blackBox, blackPaint);

    final textSpan = TextSpan(
      text: '$minutes',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400
      )
    );

    final minutesPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(
      maxWidth: 70,
      minWidth: 70
    );

    minutesPainter.paint(canvas, const Offset(40, 35));

    final minutesText = TextSpan(
      text: 'Min',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w300
      )
    );

    final minutesMinPainter = TextPainter(
      text: minutesText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(
      maxWidth: 70,
      minWidth: 70
    );

    minutesMinPainter.paint(canvas, const Offset(40, 68));


    final locationText = TextSpan(
      text: destination,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 20,
        fontWeight: FontWeight.w300
      )
    );

    final locationPainter = TextPainter(
      maxLines: 2,
      ellipsis: '...',
      text: locationText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left
    )..layout(
      maxWidth: size.width - 135,
      minWidth: size.width - 135
    );

    final double offsetY = (destination.length > 20) ? 35 : 48;

    locationPainter.paint(canvas, Offset(120, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}