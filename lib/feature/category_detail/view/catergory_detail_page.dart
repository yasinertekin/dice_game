import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/model/dice_categories/dice_categories.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({
    required this.diceCategories,
    super.key,
  });

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
    super.key,
  });

  final DiceCategories? diceCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diceCategories?.categoryName ?? ''),
      ),
      body: ListView.builder(
        itemCount: diceCategories?.diceList?.length ?? 0,
        itemBuilder: (context, index) {
          final diceList = diceCategories?.diceList;
          return ListTile(
            title: Text(
              diceList?[index].diceName ?? '',
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
