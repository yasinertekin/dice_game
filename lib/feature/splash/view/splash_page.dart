import 'package:dice_game/product/router/route_paths.dart';
import 'package:dice_game/product/router/router_manager.dart';
import 'package:flutter/material.dart';

/// Splash Page
final class SplashPage extends StatelessWidget {
  /// Constructor
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SplashView();
  }
}

final class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('Splash Page'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              RouterManager.routes.go(RoutePaths.home.path);
            },
            child: const Text('Next Page'),
          ),
        ],
      ),
    );
  }
}
