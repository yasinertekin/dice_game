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
import 'package:dice_game/feature/splash/view/splash_page.dart' as _i3;
import 'package:dice_game/feature/sub_dices/view/sub_dices_page.dart' as _i4;
import 'package:dice_game/feature/user_dice/view/user_dice_page.dart' as _i5;
import 'package:dice_game/product/model/categories/categories.dart' as _i7;
import 'package:dice_game/product/model/options/options.dart' as _i9;
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
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    SubDicesRoute.name: (routeData) {
      final args = routeData.argsAs<SubDicesRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SubDicesPage(
          categoryOptions: args.categoryOptions,
          key: args.key,
        ),
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
/// [_i3.SplashPage]
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
/// [_i4.SubDicesPage]
class SubDicesRoute extends _i6.PageRouteInfo<SubDicesRouteArgs> {
  SubDicesRoute({
    required List<_i9.Options> categoryOptions,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SubDicesRoute.name,
          args: SubDicesRouteArgs(
            categoryOptions: categoryOptions,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SubDicesRoute';

  static const _i6.PageInfo<SubDicesRouteArgs> page =
      _i6.PageInfo<SubDicesRouteArgs>(name);
}

class SubDicesRouteArgs {
  const SubDicesRouteArgs({
    required this.categoryOptions,
    this.key,
  });

  final List<_i9.Options> categoryOptions;

  final _i8.Key? key;

  @override
  String toString() {
    return 'SubDicesRouteArgs{categoryOptions: $categoryOptions, key: $key}';
  }
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
