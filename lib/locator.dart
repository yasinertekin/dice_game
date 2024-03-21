import 'package:dice_game/feature/favorite/cubit/favorite_cubit.dart';
import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/product/core/enum/hive_key.dart';
import 'package:dice_game/product/utils/cache/cache_manager.dart';
import 'package:dice_game/product/utils/router/app_router.dart';
import 'package:get_it/get_it.dart';

/// A class that is used to locate the cubits
abstract final class Locator {
  static final _instance = GetIt.instance;

  /// This method is used to setup the locator
  static UserDiceCubit get userDiceCubit => _instance<UserDiceCubit>();

  /// Favorite Cubit
  static FavoriteCubit get favoriteCubit => _instance<FavoriteCubit>();

  /// App Router
  static AppRouter get appRouter => _instance<AppRouter>();

  /// This method is used to setup the locator
  static Future<void> setup() async {
    /// User Dice Cubit

    _instance
      ..registerFactory<UserDiceCubit>(
        () => UserDiceCubit(_instance()),
      )

      /// Favorite Cubit
      ..registerFactory<FavoriteCubit>(
        () => FavoriteCubit(
          _instance(),
        ),
      )

      /// Favorite Cache Manager
      ..registerFactory<FavoriteCacheManager>(
        FavoriteCacheManager.new,
      )
      ..registerSingleton<AppRouter>(AppRouter())

      /// User Dice Cache Manager
      ..registerFactory<CategoryDicesCacheManager>(
        () => CategoryDicesCacheManager(
          HiveKey.categoryDicesManagerKey.value,
        ),
      );
  }
}
