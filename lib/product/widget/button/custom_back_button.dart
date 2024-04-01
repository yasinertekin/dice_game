import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:flutter/material.dart';

/// CustomBackButton

final class CustomBackButton extends StatelessWidget with NavigationManager {
  /// CustomBackButton constructor
  const CustomBackButton({
    super.key,
    this.pageRouteInfo,
  });

  final PageRouteInfo? pageRouteInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pageRouteInfo != null ? navigatePush(pageRouteInfo!) : navigatePop();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: _BackButtonDecoration(),
        child: const _ArrowBackIcon(),
      ),
    );
  }
}

@immutable
final class _ArrowBackIcon extends StatelessWidget {
  const _ArrowBackIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back,
      color: ProjectColor.white.toColor,
    );
  }
}

@immutable
final class _BackButtonDecoration extends BoxDecoration {
  _BackButtonDecoration()
      : super(
          shape: BoxShape.circle,
          color: ProjectColor.transparent.toColor,
          border: Border.all(
            color: ProjectColor.white.toColor,
            width: 5,
          ),
        );
}
