import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/product/core/enum/hive_key.dart';
import 'package:dice_game/product/utils/cache/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that initializes the state of the app
final class StateInitialize extends StatelessWidget {
  /// Creates a new instance of the [StateInitialize] class.
  const StateInitialize({required this.child, super.key});

  /// The child widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add the providers here
        BlocProvider<UserDiceCubit>(
          create: (context) => UserDiceCubit(
            CategoryDicesCacheManager(HiveKey.categoryDicesManagerKey.value),
          )..fetchUserDice(),
        ),
      ],
      child: child,
    );
  }
}
