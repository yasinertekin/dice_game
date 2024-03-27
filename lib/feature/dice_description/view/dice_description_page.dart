import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/favorite/cubit/favorite_cubit.dart';
import 'package:dice_game/feature/favorite/cubit/state/favorite_state.dart';
import 'package:dice_game/locator.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/image/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mixin/dice_description_view_mixin.dart';

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

final class _DiceDescriptionView extends StatefulWidget {
  const _DiceDescriptionView({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  State<_DiceDescriptionView> createState() => _DiceDescriptionViewState();
}

final class _DiceDescriptionViewState extends State<_DiceDescriptionView>
    with _DiceDescriptionViewMixin {
  @override
  Future<void> _showDatePicker() async {
    if (widget.categoryDices.isAdultContent ?? false) {
      final pickedDate = await showDatePicker(
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        keyboardType: TextInputType.datetime,
      );
      if (pickedDate == null) {
        Locator.appRouter.navigate(const HomeRoute());
        return;
      }

      final today = DateTime.now();
      final minimumDate =
          today.subtract(const Duration(days: 18 * 365)); // 18 years ago
      if (pickedDate.isAfter(minimumDate)) {
        // Kullanıcı 18 yaşından küçük, işlem yapma

        await _showAlerDialog();
        return;
      }
    }
  }

  @override
  Future<void> _showAlerDialog() async {
    await showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Uyarı'),
          content: const Text('18 yaşından küçükler işlem yapamaz!'),
          actions: [
            TextButton(
              onPressed: () {
                Locator.appRouter.pushAndPopUntil(
                  const HomeRoute(),
                  predicate: (route) => false,
                );
              },
              child: const Text('Geri Dön'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _DiceDescriptionStack(categoryDices: widget.categoryDices),
            _RollDiceButton(
              widget.categoryDices,
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
        child: _RollIcon(
          categoryDices,
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
    return GestureDetector(
      onTap: () => Locator.appRouter.popAndPush(
        RollDiceRoute(
          categoryDices: categoryDices,
          options: categoryDices.subDices!.first,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _DiceIcon(categoryDices: categoryDices),
          const _CasinoIcon(),
          const _RollDiceText(),
        ],
      ),
    );
  }
}

final class _CasinoIcon extends StatelessWidget {
  const _CasinoIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: context.dynamicHeight(0.04),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ProjectColor.red.toColor,
          border: Border.all(
            color: ProjectColor.white.toColor,
            width: 8,
          ),
        ),
        child: Padding(
          padding: context.paddingAllLow,
          child: const Icon(
            Icons.casino,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

final class _RollDiceText extends StatelessWidget {
  const _RollDiceText();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.dynamicHeight(0.1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: context.borderRadiusLow,
          side: BorderSide(
            color: ProjectColor.white.toColor,
            width: 7,
          ),
        ),
        color: ProjectColor.red.toColor,
        child: Padding(
          padding: context.paddingAllDefault,
          child: Text(
            'Zar At!',
            style: context.textTheme.displayLarge?.copyWith(
              color: ProjectColor.white.toColor,
            ),
          ),
        ),
      ),
    );
  }
}

final class _DiceIcon extends StatelessWidget {
  const _DiceIcon({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        margin: context.paddingAllLow,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ProjectColor.white.toColor,
            width: 20,
          ),
        ),
        child: Padding(
          padding: context.paddingAllHigh,
          child: CustomSvg(
            assetPath: categoryDices.icon ?? '',
            height: context.dynamicHeight(0.15),
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
                      const CustomBackButton(
                        pageRouteInfo: HomeRoute(),
                      ),
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
