import 'package:flutter/material.dart';

class CurvedShapePainter extends CustomPainter {
  final BuildContext context;
  CurvedShapePainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Theme.of(context).brightness == Brightness.dark
          ? Colors.black38
          : Colors.black12
      ..style = PaintingStyle.fill;

    var path = Path()
      ..lineTo(0, size.height * 0.6)
      ..cubicTo(
        size.width * 0.4,
        size.height * 0.6,
        size.width * 0.6, //0.7
        size.height,
        size.width,
        size.height * 0.9, //0.7
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
