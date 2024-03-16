import 'package:dice_game/product/router/router_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const _DiceApp());
}

final class _DiceApp extends StatelessWidget {
  const _DiceApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterManager.routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.aDLaMDisplayTextTheme(),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
