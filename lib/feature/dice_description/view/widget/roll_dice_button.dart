part of '../dice_description_page.dart';

final class _RollDiceButton extends StatelessWidget {
  const _RollDiceButton(
    this.categoryDices,
  );

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: ProjectColor.red.toColor,
        child: _RollIcon(
          categoryDices,
        ),
      ),
    );
  }
}
