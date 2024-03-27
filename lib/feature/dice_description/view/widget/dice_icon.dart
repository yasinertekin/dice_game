part of '../dice_description_page.dart';

final class _DiceIcon extends StatelessWidget {
  const _DiceIcon({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        margin: context.paddingAllLow,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ProjectColor.white.toColor,
            width: 20,
          ),
        ),
        child: Padding(
          padding: context.paddingAllHigh,
          child: CustomSvg(
            assetPath: categoryDices.icon ?? '',
            height: context.dynamicHeight(0.15),
          ),
        ),
      ),
    );
  }
}
