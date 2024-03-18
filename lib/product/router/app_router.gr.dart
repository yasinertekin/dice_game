// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:dice_game/feature/category_detail/view/catergory_detail_page.dart'
    as _i1;
import 'package:dice_game/feature/home/view/home_page.dart' as _i2;
import 'package:dice_game/feature/roll_dice/view/roll_dice_page.dart' as _i3;
import 'package:dice_game/feature/splash/view/splash_page.dart' as _i4;
import 'package:dice_game/feature/user_dice/view/user_dice_page.dart' as _i5;
import 'package:dice_game/product/model/categories/categories.dart' as _i7;
import 'package:dice_game/product/model/category_dices/category_dices.dart'
    as _i9;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CategoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CategoryDetailPage(
          diceCategories: args.diceCategories,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    RollDiceRoute.name: (routeData) {
      final args = routeData.argsAs<RollDiceRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.RollDicePage(
          categoryDices: args.categoryDices,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    UserDiceRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.UserDicePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoryDetailPage]
class CategoryDetailRoute extends _i6.PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({
    required _i7.Categories? diceCategories,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CategoryDetailRoute.name,
          args: CategoryDetailRouteArgs(
            diceCategories: diceCategories,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailRoute';

  static const _i6.PageInfo<CategoryDetailRouteArgs> page =
      _i6.PageInfo<CategoryDetailRouteArgs>(name);
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({
    required this.diceCategories,
    this.key,
  });

  final _i7.Categories? diceCategories;

  final _i8.Key? key;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{diceCategories: $diceCategories, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RollDicePage]
class RollDiceRoute extends _i6.PageRouteInfo<RollDiceRouteArgs> {
  RollDiceRoute({
    required _i9.CategoryDices categoryDices,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          RollDiceRoute.name,
          args: RollDiceRouteArgs(
            categoryDices: categoryDices,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RollDiceRoute';

  static const _i6.PageInfo<RollDiceRouteArgs> page =
      _i6.PageInfo<RollDiceRouteArgs>(name);
}

class RollDiceRouteArgs {
  const RollDiceRouteArgs({
    required this.categoryDices,
    this.key,
  });

  final _i9.CategoryDices categoryDices;

  final _i8.Key? key;

  @override
  String toString() {
    return 'RollDiceRouteArgs{categoryDices: $categoryDices, key: $key}';
  }
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.UserDicePage]
class UserDiceRoute extends _i6.PageRouteInfo<void> {
  const UserDiceRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserDiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDiceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
