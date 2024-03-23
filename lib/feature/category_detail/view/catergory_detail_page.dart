import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/model/categories/categories.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/container/custom_gradient_container.dart';
import 'package:dice_game/product/widget/grid_list/dice_category_grid_view.dart';
import 'package:flutter/material.dart';

part 'widget/category_detail_app_bar.dart';

@RoutePage()

/// CategoryDetailPage
final class CategoryDetailPage extends StatelessWidget {
  /// CategoryDetailPage
  const CategoryDetailPage({
    required this.diceCategories,
    super.key,
  });

  /// DiceCategories
  final Categories? diceCategories;

  @override
  Widget build(BuildContext context) {
    return _CategoryDetailView(
      diceCategories: diceCategories,
    );
  }
}

final class _CategoryDetailView extends StatelessWidget {
  const _CategoryDetailView({
    required this.diceCategories,
  });

  final Categories? diceCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      appBar: _CategoryDetailAppBar(diceCategories: diceCategories),
      body: CustomGradientContainer(
        child: DiceCategoryGridView(
          diceList: diceCategories?.categoryDices,
        ),
      ),
    );
  }
}
