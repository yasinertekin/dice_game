import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/image/custom_svg.dart';
import 'package:flutter/material.dart';

/// Category Detail Card
final class CategoryDetailCard extends StatelessWidget {
  /// Category Detail Card
  const CategoryDetailCard({
    required this.diceList,
    required this.index,
    super.key,
  });

  /// DiceList
  final List<CategoryDices>? diceList;

  /// Index
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          DiceDescriptionRoute(
            categoryDices: diceList![index],
          ),
        );
      },
      child: Padding(
        padding: context.paddingAllLow,
        child: Card(
          color: ProjectColor.red.toColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              _CategoryName(diceList: diceList, index: index),
              const Spacer(
                flex: 5,
              ),
              CustomSvg(
                assetPath: ProjectAssets.icHeard.toSvg,
                height: context.dynamicHeight(0.1),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CategoryName extends StatelessWidget {
  const _CategoryName({
    required this.diceList,
    required this.index,
  });

  final List<CategoryDices>? diceList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: context.dynamicWidth(0.7),
        child: Padding(
          padding: context.paddingAllLow,
          child: Text(
            diceList?[index].diceName ?? '',
            textAlign: TextAlign.center,
            style: context.textTheme.headlineLarge?.copyWith(
              color: ProjectColor.white.toColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
