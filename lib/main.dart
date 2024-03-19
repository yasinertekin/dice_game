import 'package:dice_game/product/core/initialize/app_initialize.dart';
import 'package:dice_game/product/core/initialize/state_initialize.dart';
import 'package:dice_game/product/utils/router/app_router.dart';
import 'package:dice_game/product/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppInitialize.initialize();
  runApp(
    StateInitialize(child: _DiceApp()),
  );
}

final class _DiceApp extends StatelessWidget {
  _DiceApp();

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',

      /// This is the theme of the app
      theme: CustomTheme().themeData,

      /// This is the router of the app
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
