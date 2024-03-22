import 'package:auto_route/auto_route.dart';
import 'package:dice_game/locator.dart';

/// A mixin that is used to navigate between pages
base mixin NavigationManager {
  /// This method is used to navigate to the page
  void navigatePush(PageRouteInfo pageRouteInfo) {
    Locator.appRouter.popAndPush(
      pageRouteInfo,
    );
  }

  /// This method is used to navigate to the previous page
  void navigatePop() {
    Locator.appRouter.maybePop<void>();
  }
}
