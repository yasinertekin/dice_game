import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/user_dice/cubit/state/user_dice_state.dart';
import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/card/category_detail_card.dart';
import 'package:dice_game/product/widget/container/custom_gradient_container.dart';
import 'package:dice_game/product/widget/loading/custom_circular_progress_indicator.dart';
import 'package:dice_game/product/widget/text/custom_text.dart';
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
              return GridView.builder(
                gridDelegate: const _SliverGridDelegate(),
                itemCount: (state.categoryDices?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index == state.categoryDices?.length) {
                    return const _AddDiceButton();
                  } else {
                    return CategoryDetailCard(
                      diceList: state.categoryDices,
                      onLongPress: () {
                        context.read<UserDiceCubit>().deleteUserDice(
                              state.categoryDices![index],
                            );
                      },
                      index: index,
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}

final class _AddDiceButton extends StatelessWidget with NavigationManager {
  const _AddDiceButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: Card(
        color: ProjectColor.concreteSideWalk.toColor,
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: ProjectColor.white.toColor,
            size: 40,
          ),
          onPressed: () {
            navigatePush(
              const AddDiceRoute(),
            );
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
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_forever),
          onPressed: () {
            context.read<UserDiceCubit>().deleteAllUserDice();
          },
        ),
      ],
      title: CustomText(
        text: 'Zarlarım',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
      leading: const CustomBackButton(
        pageRouteInfo: HomeRoute(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _SliverGridDelegate
    extends SliverGridDelegateWithFixedCrossAxisCount {
  const _SliverGridDelegate()
      : super(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
        );
}
