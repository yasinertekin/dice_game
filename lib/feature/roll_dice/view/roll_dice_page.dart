import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/model/sub_dices/sub_dices.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class RollDicePage extends StatelessWidget {
  const RollDicePage({
    required this.options,
    super.key,
  });
  final SubDices options;

  @override
  Widget build(BuildContext context) {
    return _RollDiceView(
      options: options,
    );
  }
}

final class _RollDiceView extends StatelessWidget {
  const _RollDiceView({
    required this.options,
  });

  final SubDices? options;

  @override
  Widget build(BuildContext context) {
    // Select a random option from the list
    final random = Random();
    final randomIndex = random.nextInt(options!.options!.length);
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: AppBar(
        backgroundColor: ProjectColor.concreteSideWalk.toColor,
        title: const Text('Roll Dice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              options!.options![randomIndex].name.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(options?.options?.length);
              },
              child: const Text('Roll the dice'),
            ),
            const SizedBox(height: 16),
            const Text('Roll the dice'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
