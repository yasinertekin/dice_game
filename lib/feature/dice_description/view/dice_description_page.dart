import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/dice_description/cubit/dice_description_cubit.dart';
import 'package:dice_game/feature/favorite/cubit/favorite_cubit.dart';
import 'package:dice_game/feature/favorite/cubit/state/favorite_state.dart';
import 'package:dice_game/locator.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/utils/localization/locale_keys.g.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/image/custom_svg.dart';
import 'package:dice_game/product/widget/text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mixin/dice_description_view_mixin.dart';
part 'widget/casino_icon.dart';
part 'widget/dark_overlay_container.dart';
part 'widget/dice_icon.dart';
part 'widget/dice_image.dart';
part 'widget/favorite_button.dart';
part 'widget/roll_dice_button.dart';
part 'widget/roll_dice_description.dart';
part 'widget/roll_dice_text.dart';
part 'widget/roll_icon.dart';

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
    return BlocProvider(
      create: (context) => DiceDescriptionCubit(),
      child: _DiceDescriptionView(
        categoryDices: categoryDices,
      ),
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
  Future<void> _showAlerDialog() async {
    await showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const _CustomAlertDialog();
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

final class _CustomAlertDialog extends StatelessWidget {
  const _CustomAlertDialog();

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: CustomText(
        text: LocaleKeys.dice_decription_warning,
      ),
      content: CustomText(
        text: LocaleKeys.dice_decription_age_limit,
      ),
      actions: [
        _BackButton(),
      ],
    );
  }
}

final class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Locator.appRouter.pushAndPopUntil(
          const HomeRoute(),
          predicate: (route) => false,
        );
      },
      child: const CustomText(
        text: LocaleKeys.dice_decription_warning,
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
