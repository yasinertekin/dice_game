import 'package:dice_game/product/initialize/theme/custom_theme.dart';
import 'package:dice_game/product/router/router_manager.dart';
import 'package:flutter/material.dart';

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
      theme: CustomTheme().themeData,
    );
  }
}
