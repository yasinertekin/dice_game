import 'package:auto_route/annotations.dart';
import 'package:dice_game/feature/user_dice/cubit/state/user_dice_state.dart';
import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// A page to display the user dice
final class UserDicePage extends StatelessWidget {
  /// Creates a new instance of the [UserDicePage] class.
  const UserDicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserDiceView();
  }
}

final class _UserDiceView extends StatelessWidget {
  const _UserDiceView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserDiceCubit>().addUserDice(
                CategoryDices(
                  diceName: 'Dice 1',
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('User Dice'),
        actions: const [],
      ),
      body: BlocBuilder<UserDiceCubit, UserDiceState>(
        builder: (context, state) {
          if (state.isLoading ?? false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.error?.isNotEmpty ?? false) {
            return Center(
              child: Text(state.error!),
            );
          } else {
            return ListView.builder(
              itemCount: state.categoryDices.length,
              itemBuilder: (context, index) {
                final categoryDice = state.categoryDices[index];
                return ListTile(
                  title: Text(categoryDice.diceName ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
