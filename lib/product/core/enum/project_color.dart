import 'package:flutter/material.dart';

/// ProjectColor
enum ProjectColor {
  /// White Color
  white(Color(0xFFFFFFFF)),

  /// Silky White Color is the color of the background
  silkyWhite(Color(0xFFEFEBE2)),

  /// Black Color
  black(Color(0xFF000000)),

  /// Buzz-in color is the color of the splash screen
  buzzIn(Color(0xFFFFD752));

  /// Color
  final Color color;

  /// Constructor
  // ignore: sort_constructors_first
  const ProjectColor(this.color);
}
