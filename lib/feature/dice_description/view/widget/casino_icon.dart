part of '../dice_description_page.dart';

final class _CasinoIcon extends StatelessWidget {
  const _CasinoIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: context.dynamicHeight(0.04),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ProjectColor.red.toColor,
          border: Border.all(
            color: ProjectColor.white.toColor,
            width: 8,
          ),
        ),
        child: Padding(
          padding: context.paddingAllLow,
          child: const Icon(
            Icons.casino,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
