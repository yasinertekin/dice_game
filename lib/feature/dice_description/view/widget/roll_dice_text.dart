part of '../dice_description_page.dart';

final class _RollDiceText extends StatelessWidget {
  const _RollDiceText();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.dynamicHeight(0.1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: context.borderRadiusLow,
          side: BorderSide(
            color: ProjectColor.white.toColor,
            width: 7,
          ),
        ),
        color: ProjectColor.red.toColor,
        child: Padding(
          padding: context.paddingAllDefault,
          child: Text(
            'Zar At!',
            style: context.textTheme.displayLarge?.copyWith(
              color: ProjectColor.white.toColor,
            ),
          ),
        ),
      ),
    );
  }
}
