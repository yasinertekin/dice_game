part of '../catergory_detail_page.dart';

final class _CategoryDetailCard extends StatelessWidget {
  const _CategoryDetailCard({
    required this.diceList,
    required this.index,
  });

  final List<CategoryDices>? diceList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          RollDiceRoute(
            categoryDices: diceList![index],
          ),
        );
      },
      child: Card(
        color: ProjectColor.red.toColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            FittedBox(
              child: SizedBox(
                width: context.dynamicWidth(0.7),
                child: Padding(
                  padding: context.paddingAllLow,
                  child: Text(
                    diceList?[index].diceName ?? '',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: ProjectColor.white.toColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            CustomSvg(
              assetPath: ProjectAssets.icHeard.toSvg,
              height: context.dynamicHeight(0.1),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
