import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/favorite/cubit/favorite_cubit.dart';
import 'package:dice_game/feature/favorite/cubit/state/favorite_state.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _DiceDescriptionStack(categoryDices: categoryDices),
            const _RollDiceButton(),
          ],
        ),
      ),
    );
  }
}

final class _RollDiceButton extends StatelessWidget {
  const _RollDiceButton();

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
              IconButton(
                icon: Icon(
                  Icons.casino,
                  color: ProjectColor.white.toColor,
                ),
                iconSize: context.dynamicHeight(0.3),
                onPressed: () {
                  context.router.maybePop();
                },
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
          const _DiceImage(),
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
                  const CustomBackButton(),
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

class _DarkOverlayContainer extends StatelessWidget {
  const _DarkOverlayContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(
        0.7,
      ), // 0.5 opaklık seviyesini ayarlayabilirsiniz
    );
  }
}

class _DiceImage extends StatelessWidget {
  const _DiceImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ProjectAssets.imgLibrary.toPng,
      fit: BoxFit.cover,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
    );
  }
}

final class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.categoryDices,
    super.key,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return IconButton(
          icon: const Icon(Icons.casino),
          iconSize: context.dynamicHeight(0.3),
          onPressed: () {
            context.read<FavoriteCubit>().addFavorite(
                  categoryDices,
                );
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
      child: Text(
        textAlign: TextAlign.center,
        categoryDices.description ?? '',
        style: context.textTheme.titleMedium?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
    );
  }
}
