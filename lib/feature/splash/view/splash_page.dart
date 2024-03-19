import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

part 'mixin/splash_view_mixin.dart';

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

final class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

final class _SplashViewState extends State<_SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.buzzIn.toColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ProjectAssets.imgAppLogo.toPng,
              height: context.sized.dynamicHeight(0.1),
            ),
            Image.asset(
              ProjectAssets.imgSplashSubtitle.toPng,
              height: context.sized.dynamicHeight(0.1),
            ),
            const Text('İşini Şansa Bırak'),
          ],
        ),
      ),
    );
  }
}
