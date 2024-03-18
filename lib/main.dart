import 'package:dice_game/product/initialize/state_initialize.dart';
import 'package:dice_game/product/initialize/theme/custom_theme.dart';
import 'package:dice_game/product/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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
      theme: CustomTheme().themeData,

      /// This is the router of the app
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
