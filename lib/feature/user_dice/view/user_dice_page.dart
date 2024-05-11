import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/user_dice/cubit/state/user_dice_state.dart';
import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/mixin/admob_mixin.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/utils/localization/locale_keys.g.dart';
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

final class _UserDiceView extends StatefulWidget {
  const _UserDiceView();

  @override
  State<_UserDiceView> createState() => _UserDiceViewState();
}

final class _UserDiceViewState extends State<_UserDiceView> with AdmobMixin {
  @override
  Widget build(BuildContext context) {
    return CustomGradientContainer(
      child: Scaffold(
        backgroundColor: ProjectColor.transparent.toColor,
        appBar: const _UserDiceAppBar(),
        body: const _ScaffoldBody(),
      ),
    );
  }
}

final class _ScaffoldBody extends StatelessWidget {
  const _ScaffoldBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDiceCubit, UserDiceState>(
      builder: (context, state) {
        if (state.isLoading ?? false) {
          return const CustomCircularProgressIndicator();
        } else if (state.error?.isNotEmpty ?? false) {
          return Center(
            child: Text(state.error!),
          );
        } else {
          return _UserDiceList(
            categoryDices: state.categoryDices,
          );
        }
      },
    );
  }
}

final class _UserDiceList extends StatelessWidget {
  const _UserDiceList({
    required this.categoryDices,
  });

  final List<CategoryDices>? categoryDices;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const _SliverGridDelegate(),
      itemCount: (categoryDices?.length ?? 0) + 1,
      itemBuilder: (context, index) {
        if (index == categoryDices?.length) {
          return const _AddDiceButton();
        } else {
          return CategoryDetailCard(
            diceList: categoryDices,
            onLongPress: () {
              context.read<UserDiceCubit>().deleteUserDice(
                    categoryDices![index],
                  );
            },
            index: index,
          );
        }
      },
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
      title: CustomText(
        text: LocaleKeys.users_dice_my_dice,
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
