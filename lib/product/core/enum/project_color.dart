import 'package:flutter/material.dart';

/// ProjectColor
enum ProjectColor {
  /// White Color
  white('FFFFFF'),

  /// Silky White Color is the color of the background
  silkyWhite('EFEBE2'),

  /// Black Color
  black('000000'),

  /// Buzz-in color is the color of the splash screen
  buzzIn('FFD752'),

  /// Transparent Color
  transparent('00000000'),

  /// White Side Walk Color
  concreteSideWalk('8D8983'),

  /// Food And Drink Color
  red('B81C1C');

  final String _color;

  // ignore: sort_constructors_first
  const ProjectColor(this._color);

  /// Color
  Color get toColor => Color(int.parse('0xFF$_color'));
}
