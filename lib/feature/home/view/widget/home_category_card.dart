part of '../home_page.dart';

final class _HomeCategoryCard extends StatelessWidget with NavigationManager {
  const _HomeCategoryCard({
    required this.dice,
    required this.index,
  });

  final Categories? dice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigatePush(
        CategoryDetailRoute(
          diceCategories: dice,
        ),
      ),
      child: Card(
        color: dice?.categoryColor != null
            ? _CardColor(dice!.categoryColor.toString())
            : ProjectColor.buzzIn.toColor,
        child: Padding(
          padding: context.paddingAllLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _CategoryTitle(dice: dice),
              _CategoryIcon(dice: dice),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({
    required this.dice,
  });

  final Categories? dice;

  @override
  Widget build(BuildContext context) {
    return CustomSvg(
      assetPath: dice?.categoryIcon ?? '',
      height: context.dynamicHeight(0.13),
    );
  }
}

final class _CategoryTitle extends StatelessWidget {
  const _CategoryTitle({
    required this.dice,
  });

  final Categories? dice;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      dice?.categoryName ?? '',
      style: context.textTheme.titleLarge?.copyWith(
        color: ProjectColor.white.toColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

final class _CardColor extends Color {
  _CardColor(
    String color,
  ) : super(int.parse('0xFF$color'));
}
