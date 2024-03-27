part of '../dice_description_page.dart';

final class _DiceImage extends StatelessWidget {
  const _DiceImage(
    this.categoryDices,
  );

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      categoryDices.diceImage ?? ProjectAssets.imgLibrary.toPng,
      fit: BoxFit.cover,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
    );
  }
}
