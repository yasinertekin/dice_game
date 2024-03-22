import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/favorite/cubit/favorite_cubit.dart';
import 'package:dice_game/feature/favorite/cubit/state/favorite_state.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// RollDicePage
final class DiceDescriptionPage extends StatelessWidget {
  /// RollDicePage constructor
  const DiceDescriptionPage({
    required this.categoryDices,
    super.key,
  });

  /// The sub dices
  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return _DiceDescriptionView(
      categoryDices: categoryDices,
    );
  }
}

final class _DiceDescriptionView extends StatelessWidget {
  const _DiceDescriptionView({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _DiceDescriptionStack(categoryDices: categoryDices),
            _RollDiceButton(
              categoryDices,
            ),
          ],
        ),
      ),
    );
  }
}

final class _RollDiceButton extends StatelessWidget {
  const _RollDiceButton(
    this.categoryDices,
  );

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: ProjectColor.red.toColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Roll the dice',
                style: context.textTheme.titleLarge?.copyWith(
                  color: ProjectColor.white.toColor,
                ),
              ),
              _RollIcon(
                categoryDices,
              ),
              Text(
                'Tap the dice to roll',
                style: context.textTheme.titleSmall?.copyWith(
                  color: ProjectColor.white.toColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _RollIcon extends StatelessWidget with NavigationManager {
  const _RollIcon(
    this.categoryDices,
  );

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.casino,
        color: ProjectColor.white.toColor,
      ),
      iconSize: context.dynamicHeight(0.3),
      onPressed: () {
        navigatePush(
          RollDiceRoute(options: categoryDices.subDices!.first),
        );
      },
    );
  }
}

final class _DiceDescriptionStack extends StatelessWidget {
  const _DiceDescriptionStack({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          _DiceImage(
            categoryDices,
          ),
          const _DarkOverlayContainer(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomBackButton(),
                      _FavoriteButton(
                        categoryDices: categoryDices,
                      ),
                    ],
                  ),
                  _RollDiceDescription(
                    categoryDices: categoryDices,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _DarkOverlayContainer extends StatelessWidget {
  const _DarkOverlayContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(
        0.7,
      ), // 0.5 opaklık seviyesini ayarlayabilirsiniz
    );
  }
}

final class _DiceImage extends StatelessWidget {
  const _DiceImage(
    this.categoryDices,
  );

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      categoryDices.diceImage ?? ProjectAssets.imgLibrary.toPng,
      fit: BoxFit.cover,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
    );
  }
}

final class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.categoryDices.contains(categoryDices)
                ? Icons.favorite
                : Icons.favorite_border,
            color: ProjectColor.white.toColor,
          ),
          iconSize: context.dynamicHeight(0.07),
          onPressed: () {
            if (state.categoryDices.contains(categoryDices)) {
              context.read<FavoriteCubit>().removeFavorite(categoryDices);
            } else {
              context.read<FavoriteCubit>().addFavorite(categoryDices);
            }
          },
        );
      },
    );
  }
}

final class _RollDiceDescription extends StatelessWidget {
  const _RollDiceDescription({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: SizedBox(
        height: context.dynamicHeight(0.35),
        child: SingleChildScrollView(
          child: Text(
            textAlign: TextAlign.center,
            categoryDices.description ?? '',
            style: context.textTheme.titleMedium?.copyWith(
              color: ProjectColor.white.toColor,
            ),
          ),
        ),
      ),
    );
  }
}
