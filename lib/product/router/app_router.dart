import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')

/// AppRouter
final class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(page: SplashRoute.page, initial: true),
        AdaptiveRoute(page: HomeRoute.page),
        AdaptiveRoute(page: UserDiceRoute.page),
        AdaptiveRoute(page: CategoryDetailRoute.page),
      ];
}
