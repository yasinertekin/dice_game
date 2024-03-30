import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/widget/card/category_detail_card.dart';
import 'package:flutter/material.dart';

/// CustomCategoryBuilder
final class DiceCategoryGridView extends StatelessWidget {
  /// CustomCategoryBuilder
  const DiceCategoryGridView({
    required this.diceList,
    super.key,
  });

  /// DiceList
  final List<CategoryDices>? diceList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const _SliverGridDelegate(),
      itemCount: diceList?.length ?? 0,
      itemBuilder: (context, index) {
        return CategoryDetailCard(
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
          mainAxisExtent: 215,
          crossAxisSpacing: 15,
        );
}
