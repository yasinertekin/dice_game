import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/router/route_paths.dart';
import 'package:dice_game/product/router/router_manager.dart';
import 'package:dice_game/product/widget/custom_svg.dart';
import 'package:flutter/material.dart';

part 'widget/bottom_bar.dart';
part 'widget/custom_divider.dart';
part 'widget/favorite_icon.dart';
part 'widget/home_app_bar.dart';
part 'widget/home_title.dart';
part 'widget/menu_icon.dart';
part 'widget/user_dice_card.dart';

/// HomePage
final class HomePage extends StatelessWidget {
  /// HomePage constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

final class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.color,
      appBar: const _HomeAppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _HomeTitle(),
            Spacer(),
            _UserDiceCard(),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}
