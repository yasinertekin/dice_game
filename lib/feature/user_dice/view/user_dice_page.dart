import 'package:auto_route/annotations.dart';
import 'package:dice_game/feature/user_dice/cubit/state/user_dice_state.dart';
import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/container/custom_gradient_container.dart';
import 'package:dice_game/product/widget/grid_list/dice_category_grid_view.dart';
import 'package:dice_game/product/widget/loading/custom_circular_progress_indicator.dart';
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
    return CustomGradientContainer(
      child: Scaffold(
        backgroundColor: ProjectColor.transparent.toColor,
        appBar: const _UserDiceAppBar(),
        body: BlocBuilder<UserDiceCubit, UserDiceState>(
          builder: (context, state) {
            if (state.isLoading ?? false) {
              return const CustomCircularProgressIndicator();
            } else if (state.error?.isNotEmpty ?? false) {
              return Center(
                child: Text(state.error!),
              );
            } else {
              return DiceCategoryGridView(
                diceList: state.categoryDices,
              );
            }
          },
        ),
      ),
    );
  }
}

final class _UserDiceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _UserDiceAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Zarlarım',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
