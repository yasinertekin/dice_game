import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:flutter/material.dart';

@RoutePage()

/// RollDicePage
final class RollDicePage extends StatelessWidget {
  /// RollDicePage constructor
  const RollDicePage({
    required this.categoryDices,
    super.key,
  });

  /// The sub dices
  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return _RollDiceView(
      categoryDices: categoryDices,
    );
  }
}

final class _RollDiceView extends StatelessWidget {
  const _RollDiceView({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Roll Dice'),
          ),
          body: Column(
            children: [
              _RollDiceDescription(categoryDices: categoryDices),
              const Center(
                child: Text('Roll Dice'),
              ),
            ],
          ),
        ),
      ],
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
    return Text(
      textAlign: TextAlign.center,
      categoryDices.description ?? '',
    );
  }
}
