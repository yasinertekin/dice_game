import 'package:dice_game/feature/home/home.dart';
import 'package:dice_game/feature/splash/splash.dart';
import 'package:dice_game/feature/user_dice/view/user_dice_page.dart';
import 'package:dice_game/product/router/adaptive_page_builder.dart';
import 'package:dice_game/product/router/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

/// RouterManager
@immutable
final class RouterManager {
  const RouterManager._();

  /// Routes
  static GoRouter get routes => _routes;

  static final _routes = GoRouter(
    routes: [
      GoRoute(
        path: RoutePaths.initial.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: RoutePaths.home.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: RoutePaths.userDice.path,
        pageBuilder: (context, state) {
          final myParameter = state;

          return AdaptivePageBuilder.builder<void>(
            child: UserDicePage(myParameter: myParameter),
          );
        },
      ),
    ],
  );
}
