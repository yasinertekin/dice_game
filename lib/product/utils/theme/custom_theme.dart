import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/utils/theme/app_theme.dart';
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
        appBarTheme: appBarTheme,
        cardTheme: cardTheme,
      );
  @override
  TextTheme get textTheme => GoogleFonts.aDLaMDisplayTextTheme();

  @override
  BottomAppBarTheme get bottomAppBarTheme => BottomAppBarTheme(
        color: ProjectColor.transparent.toColor,
        surfaceTintColor: ProjectColor.transparent.toColor,
        elevation: 0,
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        backgroundColor: ProjectColor.transparent.toColor,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: ProjectColor.white.toColor,
        ),
      );

  @override
  CardTheme get cardTheme => CardTheme(
        color: ProjectColor.transparent.toColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: ProjectColor.white.toColor,
            width: 4,
          ),
        ),
      );
}
