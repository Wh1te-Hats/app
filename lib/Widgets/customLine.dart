import 'package:flutter/material.dart';

class CustomLine extends CustomPainter {

  final Color color;

  CustomLine({super.repaint, required this.color});

  
  @override
  void paint(Canvas canvas, Size size, ) {
    Paint paint = Paint()
      ..color = color 
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.cubicTo(
      size.width /4,
      3 * size.height / 4,
      3 * size.width / 4,
      size.height / 4,
      size.width,
      size.height,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
