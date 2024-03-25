// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:dice_game/feature/add_dice/view/add_dice_page.dart' as _i1;
import 'package:dice_game/feature/category_detail/view/catergory_detail_page.dart'
    as _i2;
import 'package:dice_game/feature/dice_description/view/dice_description_page.dart'
    as _i3;
import 'package:dice_game/feature/favorite/view/favorite_page.dart' as _i4;
import 'package:dice_game/feature/home/view/home_page.dart' as _i5;
import 'package:dice_game/feature/roll_dice/view/roll_dice_page.dart' as _i6;
import 'package:dice_game/feature/splash/view/splash_page.dart' as _i7;
import 'package:dice_game/feature/user_dice/view/user_dice_page.dart' as _i8;
import 'package:dice_game/product/core/model/categories/categories.dart'
    as _i10;
import 'package:dice_game/product/core/model/category_dices/category_dices.dart'
    as _i12;
import 'package:dice_game/product/core/model/sub_dices/sub_dices.dart' as _i13;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AddDiceRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddDicePage(),
      );
    },
    CategoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CategoryDetailPage(
          diceCategories: args.diceCategories,
          key: args.key,
        ),
      );
    },
    DiceDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<DiceDescriptionRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DiceDescriptionPage(
          categoryDices: args.categoryDices,
          key: args.key,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FavoritePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    RollDiceRoute.name: (routeData) {
      final args = routeData.argsAs<RollDiceRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RollDicePage(
          options: args.options,
          categoryDices: args.categoryDices,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashPage(),
      );
    },
    UserDiceRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.UserDicePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddDicePage]
class AddDiceRoute extends _i9.PageRouteInfo<void> {
  const AddDiceRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AddDiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDiceRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryDetailPage]
class CategoryDetailRoute extends _i9.PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({
    required _i10.Categories? diceCategories,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CategoryDetailRoute.name,
          args: CategoryDetailRouteArgs(
            diceCategories: diceCategories,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailRoute';

  static const _i9.PageInfo<CategoryDetailRouteArgs> page =
      _i9.PageInfo<CategoryDetailRouteArgs>(name);
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({
    required this.diceCategories,
    this.key,
  });

  final _i10.Categories? diceCategories;

  final _i11.Key? key;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{diceCategories: $diceCategories, key: $key}';
  }
}

/// generated route for
/// [_i3.DiceDescriptionPage]
class DiceDescriptionRoute extends _i9.PageRouteInfo<DiceDescriptionRouteArgs> {
  DiceDescriptionRoute({
    required _i12.CategoryDices categoryDices,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          DiceDescriptionRoute.name,
          args: DiceDescriptionRouteArgs(
            categoryDices: categoryDices,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DiceDescriptionRoute';

  static const _i9.PageInfo<DiceDescriptionRouteArgs> page =
      _i9.PageInfo<DiceDescriptionRouteArgs>(name);
}

class DiceDescriptionRouteArgs {
  const DiceDescriptionRouteArgs({
    required this.categoryDices,
    this.key,
  });

  final _i12.CategoryDices categoryDices;

  final _i11.Key? key;

  @override
  String toString() {
    return 'DiceDescriptionRouteArgs{categoryDices: $categoryDices, key: $key}';
  }
}

/// generated route for
/// [_i4.FavoritePage]
class FavoriteRoute extends _i9.PageRouteInfo<void> {
  const FavoriteRoute({List<_i9.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RollDicePage]
class RollDiceRoute extends _i9.PageRouteInfo<RollDiceRouteArgs> {
  RollDiceRoute({
    required _i13.SubDices options,
    required _i12.CategoryDices categoryDices,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RollDiceRoute.name,
          args: RollDiceRouteArgs(
            options: options,
            categoryDices: categoryDices,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RollDiceRoute';

  static const _i9.PageInfo<RollDiceRouteArgs> page =
      _i9.PageInfo<RollDiceRouteArgs>(name);
}

class RollDiceRouteArgs {
  const RollDiceRouteArgs({
    required this.options,
    required this.categoryDices,
    this.key,
  });

  final _i13.SubDices options;

  final _i12.CategoryDices categoryDices;

  final _i11.Key? key;

  @override
  String toString() {
    return 'RollDiceRouteArgs{options: $options, categoryDices: $categoryDices, key: $key}';
  }
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.UserDicePage]
class UserDiceRoute extends _i9.PageRouteInfo<void> {
  const UserDiceRoute({List<_i9.PageRouteInfo>? children})
      : super(
          UserDiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDiceRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
