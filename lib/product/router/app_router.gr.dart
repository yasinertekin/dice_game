// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:dice_game/feature/category_detail/view/catergory_detail_page.dart'
    as _i1;
import 'package:dice_game/feature/home/view/home_page.dart' as _i2;
import 'package:dice_game/feature/splash/view/splash_page.dart' as _i3;
import 'package:dice_game/feature/user_dice/view/user_dice_page.dart' as _i4;
import 'package:dice_game/product/model/dice_categories/dice_categories.dart'
    as _i6;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CategoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CategoryDetailPage(
          diceCategories: args.diceCategories,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    UserDiceRoute.name: (routeData) {
      final args = routeData.argsAs<UserDiceRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.UserDicePage(
          myParameter: args.myParameter,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoryDetailPage]
class CategoryDetailRoute extends _i5.PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({
    required _i6.DiceCategories? diceCategories,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CategoryDetailRoute.name,
          args: CategoryDetailRouteArgs(
            diceCategories: diceCategories,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailRoute';

  static const _i5.PageInfo<CategoryDetailRouteArgs> page =
      _i5.PageInfo<CategoryDetailRouteArgs>(name);
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({
    required this.diceCategories,
    this.key,
  });

  final _i6.DiceCategories? diceCategories;

  final _i7.Key? key;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{diceCategories: $diceCategories, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.UserDicePage]
class UserDiceRoute extends _i5.PageRouteInfo<UserDiceRouteArgs> {
  UserDiceRoute({
    required String myParameter,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          UserDiceRoute.name,
          args: UserDiceRouteArgs(
            myParameter: myParameter,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDiceRoute';

  static const _i5.PageInfo<UserDiceRouteArgs> page =
      _i5.PageInfo<UserDiceRouteArgs>(name);
}

class UserDiceRouteArgs {
  const UserDiceRouteArgs({
    required this.myParameter,
    this.key,
  });

  final String myParameter;

  final _i7.Key? key;

  @override
  String toString() {
    return 'UserDiceRouteArgs{myParameter: $myParameter, key: $key}';
  }
}
