part of '../dice_description_page.dart';

final class _RollIcon extends StatelessWidget with NavigationManager {
  const _RollIcon(
    this.categoryDices,
  );

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    final diceDescriptionCubit = context.watch<DiceDescriptionCubit>();
    return BlocBuilder<DiceDescriptionCubit, int>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await diceDescriptionCubit.showAd();

            await Locator.appRouter.push(
              RollDiceRoute(
                categoryDices: categoryDices,
                options: categoryDices.subDices!.first,
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _DiceIcon(categoryDices: categoryDices),
              const _CasinoIcon(),
              _RollDiceText(
                categoryDices,
              ),
            ],
          ),
        );
      },
    );
  }
}
