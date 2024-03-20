import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/favorite/cubit/favorite_cubit.dart';
import 'package:dice_game/feature/favorite/cubit/state/favorite_state.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/container/custom_gradient_container.dart';
import 'package:dice_game/product/widget/grid_list/dice_category_grid_view.dart';
import 'package:dice_game/product/widget/loading/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// FavoritePage
final class FavoritePage extends StatelessWidget {
  /// FavoritePage
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _FavoriteView();
  }
}

final class _FavoriteView extends StatelessWidget {
  const _FavoriteView();

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainer(
      child: Scaffold(
        appBar: const _FavoriteAppBar(),
        backgroundColor: ProjectColor.transparent.toColor,
        body: Column(
          children: [
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CustomCircularProgressIndicator();
                }
                if (state.errorMessage.isNotEmpty) {
                  return Text(state.errorMessage);
                }
                if (state.categoryDices.isEmpty) {
                  return const Text('Favori zar bulunamadı');
                }

                return Expanded(
                  child: DiceCategoryGridView(
                    diceList: state.categoryDices,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

final class _FavoriteAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _FavoriteAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Favori Zarlar',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 10.0);
}
