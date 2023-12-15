import 'package:flutter/material.dart';

class CustomLine2 extends CustomPainter {
  final Color color;

  CustomLine2({super.repaint, required this.color});

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path originalPath = Path();
    originalPath.cubicTo(
      size.width /4,
      3 * size.height / 4,
      3 * size.width / 4,
      size.height / 4,
      size.width,
      size.height,
    );
    // Path mirroredPath = Path.from(originalPath);

    // // Mirror the path vertically
    // canvas.scale(-1.0, 1.0);
    canvas.drawPath(originalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
