import 'package:flutter/material.dart';

import '../../../constants/ui_helpers.dart';

class RedWidgetCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = kRed
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5016667, 0);
    path0.cubicTo(
        size.width * 0.4977333,
        size.height * 0.3870286,
        size.width * 0.9,
        size.height * 0.2802286,
        size.width,
        size.height * 0.5800000);
    path0.quadraticBezierTo(
        size.width * 0.9991667, size.height * 0.4300000, size.width, 0);
    path0.quadraticBezierTo(
        size.width * 0.8747917, size.height * 0.0, size.width * 0.5, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
