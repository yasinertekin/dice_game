import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:flutter/material.dart';

/// CustomGradientContainer
final class CustomGradientContainer extends StatelessWidget {
  /// CustomGradientContainer
  const CustomGradientContainer({
    required this.child,
    super.key,
  });

  /// Child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _CustomBoxDecoration(),
      child: child,
    );
  }
}

/// _CustomBoxDecoration
final class _CustomBoxDecoration extends BoxDecoration {
  _CustomBoxDecoration()
      : super(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ProjectColor.concreteSideWalk.toColor,
              ProjectColor.silkyWhite.toColor,
            ],
          ),
        );
}
