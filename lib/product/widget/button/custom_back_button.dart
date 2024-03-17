import 'package:auto_route/auto_route.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:flutter/material.dart';

final class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.popForced();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ProjectColor.transparent.toColor,
          border: Border.all(
            color: ProjectColor.white.toColor,
            width: 5,
          ),
        ),
        child: Icon(
          Icons.arrow_back,
          color: ProjectColor.white.toColor,
        ),
      ),
    );
  }
}
