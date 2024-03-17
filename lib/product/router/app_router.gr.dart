// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:dice_game/feature/home/view/home_page.dart' as _i1;
import 'package:dice_game/feature/splash/view/splash_page.dart' as _i2;
import 'package:dice_game/feature/user_dice/view/user_dice_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashPage(),
      );
    },
    UserDiceRoute.name: (routeData) {
      final args = routeData.argsAs<UserDiceRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.UserDicePage(
          myParameter: args.myParameter,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UserDicePage]
class UserDiceRoute extends _i4.PageRouteInfo<UserDiceRouteArgs> {
  UserDiceRoute({
    required String myParameter,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          UserDiceRoute.name,
          args: UserDiceRouteArgs(
            myParameter: myParameter,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDiceRoute';

  static const _i4.PageInfo<UserDiceRouteArgs> page =
      _i4.PageInfo<UserDiceRouteArgs>(name);
}

class UserDiceRouteArgs {
  const UserDiceRouteArgs({
    required this.myParameter,
    this.key,
  });

  final String myParameter;

  final _i5.Key? key;

  @override
  String toString() {
    return 'UserDiceRouteArgs{myParameter: $myParameter, key: $key}';
  }
}
