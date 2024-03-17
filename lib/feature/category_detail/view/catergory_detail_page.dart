import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/model/dice_categories/dice_categories.dart';
import 'package:dice_game/product/model/dice_list/dice_list.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/custom_svg.dart';
import 'package:flutter/material.dart';

part 'widget/category_detail_app_bar.dart';
part 'widget/category_detail_card.dart';

@RoutePage()

/// CategoryDetailPage
final class CategoryDetailPage extends StatelessWidget {
  /// CategoryDetailPage
  const CategoryDetailPage({
    required this.diceCategories,
    super.key,
  });

  /// DiceCategories
  final DiceCategories? diceCategories;

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

  final DiceCategories? diceCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: _CategoryDetailAppBar(diceCategories: diceCategories),
      body: _CategoryGridViewBuilder(diceCategories: diceCategories),
    );
  }
}

final class _CategoryGridViewBuilder extends StatelessWidget {
  const _CategoryGridViewBuilder({
    required this.diceCategories,
  });

  final DiceCategories? diceCategories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const _SliverGridDelegate(),
      itemCount: diceCategories?.diceList?.length ?? 0,
      itemBuilder: (context, index) {
        final diceList = diceCategories?.diceList;
        return _CategoryDetailCard(
          diceList: diceList,
          index: index,
        );
      },
    );
  }
}

final class _SliverGridDelegate
    extends SliverGridDelegateWithFixedCrossAxisCount {
  const _SliverGridDelegate()
      : super(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
        );
}
