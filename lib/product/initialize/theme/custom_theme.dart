import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/initialize/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// CustomTheme
final class CustomTheme implements AppTheme {
  @override
  ThemeData get themeData => ThemeData(
        textTheme: textTheme,
        bottomAppBarTheme: bottomAppBarTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
  @override
  TextTheme get textTheme => GoogleFonts.aDLaMDisplayTextTheme();

  @override
  BottomAppBarTheme get bottomAppBarTheme => BottomAppBarTheme(
        color: ProjectColor.transparent.toColor,
        surfaceTintColor: ProjectColor.transparent.toColor,
        elevation: 0,
      );
}
