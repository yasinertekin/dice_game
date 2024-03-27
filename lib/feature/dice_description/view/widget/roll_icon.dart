part of '../dice_description_page.dart';

final class _RollIcon extends StatelessWidget with NavigationManager {
  const _RollIcon(
    this.categoryDices,
  );

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Locator.appRouter.popAndPush(
        RollDiceRoute(
          categoryDices: categoryDices,
          options: categoryDices.subDices!.first,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _DiceIcon(categoryDices: categoryDices),
          const _CasinoIcon(),
          const _RollDiceText(),
        ],
      ),
    );
  }
}
