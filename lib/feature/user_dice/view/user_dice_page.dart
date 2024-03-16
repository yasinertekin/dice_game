import 'package:dice_game/product/router/route_paths.dart';
import 'package:dice_game/product/router/router_manager.dart';
import 'package:flutter/material.dart';

final class UserDicePage extends StatelessWidget {
  const UserDicePage({required this.myParameter, super.key});

  final String myParameter;

  @override
  Widget build(BuildContext context) {
    return _UserDiceView(
      myParameter,
    );
  }
}

final class _UserDiceView extends StatelessWidget {
  const _UserDiceView(
    this.myParameter,
  );

  final dynamic myParameter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dice'),
        actions: const [],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            RouterManager.routes.go(
              RoutePaths.home.path,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Text('My Parameter: $myParameter'),
          const Center(
            child: Text('User Dice Page'),
          ),
        ],
      ),
    );
  }
}
