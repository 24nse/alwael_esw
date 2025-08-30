
import 'package:flutter/material.dart';

double getResponsiveFontSize(context, {required double fontSize}) {
  final double scaleFactor = getScaleFactor(context);
  final double responsiveFontSize = fontSize * scaleFactor;

  final double lowerLimit = fontSize * 1;
  final double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit).floorToDouble();
}

double getScaleFactor(context) {
  final double width = MediaQuery.of(context).size.width;
  const double minWidth = 550; // Minimum width for scaling
  const double maxWidth = 1920; // Maximum width for scaling

  // Calculate a normalized value between 0 and 1 based on width
  final double normalizedWidth = (width - minWidth) / (maxWidth - minWidth);

  // Use lerp to interpolate between scale factors for different ranges
  final double scaleFactorA = width / 550; // Scale factor for small screens
  final double scaleFactorB =
      width / 1000; // Scale factor for medium screens (around 700)
  final double scaleFactorC = width / 1920; // Scale factor for large screens

  // Interpolate between B and C for smoother transition
  final double lerpedScaleFactor =
  lerp(scaleFactorB, scaleFactorC, normalizedWidth);

  return lerpedScaleFactor;
}

double lerp(double a, double b, double t) {
  return (1.0 - t) * a + t * b;
}









