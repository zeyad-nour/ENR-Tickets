import 'dart:math' as math;

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double value;

  WavePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red.withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final path = Path();

    double waveHeight = 20;

    path.moveTo(0, size.height * 0.8);

    for (double i = 0; i <= size.width; i++) {
      path.lineTo(
        i,
        size.height * 0.8 +
            waveHeight *
                (1 +
                    math.sin(
                      (i / size.width * 2 * math.pi) + (value * 2 * math.pi),
                    )),
      );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}