import 'package:flutter/material.dart';

abstract interface class AppTheme {
  /// ThemeData
  ThemeData get themeData;

  /// TextTheme
  TextTheme get textTheme;

  /// BottomAppBarTheme
  BottomAppBarTheme get bottomAppBarTheme;
}
