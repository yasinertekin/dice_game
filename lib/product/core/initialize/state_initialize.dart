import 'package:dice_game/feature/favorite/cubit/favorite_cubit.dart';
import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/locator.dart';
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
          create: (context) => Locator.userDiceCubit..fetchUserDice(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => Locator.favoriteCubit..fetchFavorite(),
        ),
      ],
      child: child,
    );
  }
}
