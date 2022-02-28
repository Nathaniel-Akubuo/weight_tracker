import 'package:flutter/material.dart';

import '../../../constants/ui_helpers.dart';

class SecondBlueWidgetCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = kBlue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0850000, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height * 0.6989286, size.width,
        size.height * 0.5985714);
    path0.quadraticBezierTo(size.width * 0.9002417, size.height * 0.8998286,
        size.width * 0.0841667, size.height);
    path0.lineTo(size.width * 0.0850000, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
