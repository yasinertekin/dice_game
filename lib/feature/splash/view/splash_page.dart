import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/router/app_router.gr.dart';
import 'package:flutter/material.dart';

/// Splash Page
@RoutePage()
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
              context.router.push(
                const HomeRoute(),
              );
            },
            child: const Text('Next Page'),
          ),
        ],
      ),
    );
  }
}
