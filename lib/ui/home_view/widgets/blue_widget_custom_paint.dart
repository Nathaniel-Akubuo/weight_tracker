import 'package:flutter/material.dart';

import '../../../constants/ui_helpers.dart';

class BlueWidgetCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = kBlue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0, size.height * 0.0);
    path0.cubicTo(size.width * 0.0, size.height * 0.3725000, size.width * 0.0,
        size.height * 0.3725000, size.width * 0.0, size.height * 0.5);
    path0.quadraticBezierTo(size.width * 0.2, size.height * 0.4,
        size.width * 0.2, size.height * 0.2785714);
    path0.quadraticBezierTo(size.width * 0.1779167, size.height * 0.0702286,
        size.width * 0.0008333, size.height * 0.0028571);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
