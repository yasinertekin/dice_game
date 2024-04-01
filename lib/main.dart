import 'package:dice_game/locator.dart';
import 'package:dice_game/product/core/initialize/app_initialize.dart';
import 'package:dice_game/product/core/initialize/state_initialize.dart';
import 'package:dice_game/product/utils/localization/localization_manager.dart';
import 'package:dice_game/product/utils/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppInitialize.initialize();
  runApp(
    StateInitialize(
      child: ProductLocalization(child: const _DiceApp()),
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

      /// Localizations
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
