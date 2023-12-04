import 'package:flutter/material.dart';
import 'dart:math';
class CircularProgressBar extends CustomPainter {
  final double strokeWidth;
  final double value;
  final Color backgroundColor;
  final Color foregroundColor;

  CircularProgressBar({
    this.strokeWidth = 2.0,
    this.value = 0.0,
    this.backgroundColor = Colors.redAccent,
    this.foregroundColor = Colors.blue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint foregroundPaint = Paint()
      ..shader = SweepGradient(
        colors: [
          foregroundColor.withOpacity(0.5),
          foregroundColor,
        ],
        stops: [
          0.0,
          value,
        ],
        startAngle: 0.0,
        endAngle: 2 * pi * value,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2,size.height / 2), size.width / 2, backgroundPaint);
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2), -pi / 2, 2 * pi * value, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(CircularProgressBar oldDelegate) {
    return oldDelegate.value != value;
  }
}
  class TripleCircularProgressBar extends CustomPainter {
  final double strokeWidth;
  final double exerciseValue;
  final double caloriesValue;
  final double heartRateValue;
  final Color backgroundColor;
  final Color exerciseColor;
  final Color caloriesColor;
  final Color heartRateColor;

  TripleCircularProgressBar({
    this.strokeWidth = 10.0,
    this.exerciseValue = 0.0,
    this.caloriesValue =0.0,
    this.heartRateValue= 0.0,
    this.backgroundColor =Colors.purple,
    this.exerciseColor = Colors.blue,
    this.caloriesColor=Colors.greenAccent,
    this.heartRateColor=Colors.red,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint exercisePaint = Paint()
      ..shader = SweepGradient(
        colors: [
          exerciseColor.withOpacity(0.5),
          exerciseColor,
        ],
        stops: [
          0.0,
          exerciseValue,
        ],
        startAngle: pi / 2,
        endAngle: 2 * pi * exerciseValue + pi / 2,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - strokeWidth / 2))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint caloriesPaint = Paint()
      ..shader = SweepGradient(
        colors: [
          caloriesColor.withOpacity(0.5),
          caloriesColor,
        ],
        stops: [
          0.0,
          caloriesValue,
        ],
        startAngle: pi / 2,
        endAngle: 2 * pi * caloriesValue + pi / 2,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - 2 * strokeWidth))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint heartRatePaint = Paint()
      ..shader = SweepGradient(
        colors: [
          heartRateColor.withOpacity(0.5),
          heartRateColor,
        ],
        stops: [
          0.0,
          heartRateValue,
        ],
        startAngle: pi / 2,
        endAngle: 2 * pi * heartRateValue + pi / 2,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - 3 * strokeWidth / 2))
      ..strokeWidth = strokeWidth
      ..style= PaintingStyle.stroke;

    double radius = size.width / 2 - strokeWidth / 2;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, backgroundPaint);

    double caloriesRadius = size.width / 2 - 2 * strokeWidth;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), caloriesRadius, caloriesPaint);

    double heartRateRadius = size.width / 2 - 3 * strokeWidth / 2;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), heartRateRadius, heartRatePaint);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, exercisePaint);
  }

  @override
  bool shouldRepaint(TripleCircularProgressBar oldDelegate) {
    return oldDelegate.exerciseValue != exerciseValue ||
        oldDelegate.caloriesValue != caloriesValue ||
        oldDelegate.heartRateValue != heartRateValue;
  }
}