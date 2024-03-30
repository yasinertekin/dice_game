import 'package:device_preview/device_preview.dart';
import 'package:dice_game/locator.dart';
import 'package:dice_game/product/core/initialize/app_initialize.dart';
import 'package:dice_game/product/core/initialize/state_initialize.dart';
import 'package:dice_game/product/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppInitialize.initialize();
  runApp(
    StateInitialize(
      child: DevicePreview(
        builder: (context) => const _DiceApp(),
      ),
    ),
  );
}

final class _DiceApp extends StatelessWidget {
  const _DiceApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = Locator.appRouter;
    return MaterialApp.router(
      title: 'Flutter Demo',

      /// This is the theme of the app
      theme: CustomTheme().themeData,

      /// This is the router of the app
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),

      debugShowCheckedModeBanner: false,

      /// This is the device preview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
    );
  }
}
//ca-app-pub-6166667374953390~8907305466