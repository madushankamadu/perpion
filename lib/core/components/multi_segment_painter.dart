import 'package:flutter/material.dart';
import 'dart:math';

class MultiSegmentCirclePainter extends CustomPainter {
  final List<Color> colors; // Colors passed from the constructor
  final List<double> percentages; // Percentages passed from the constructor
  final double gapSize; // Gap size in radians

  MultiSegmentCirclePainter({
    required this.colors,
    required this.percentages,
    this.gapSize = 0.05, // Default gap size (in radians)
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -pi / 2; // Starting point (top of the circle)
    double radius = size.width / 2;
    double strokeWidth = 20.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = strokeWidth;

    // Loop over the segments
    for (int i = 0; i < percentages.length; i++) {
      final sweepAngle = percentages[i] * 2 * pi - gapSize; // Reduce sweep angle to create the gap
      paint.color = colors[i]; // Set the color for this segment

      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle + gapSize; // Update start angle for the next segment
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
