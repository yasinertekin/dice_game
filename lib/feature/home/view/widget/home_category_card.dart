part of '../home_page.dart';

final class _HomeCategoryCard extends StatelessWidget {
  const _HomeCategoryCard({
    required this.dice,
    required this.index,
  });

  final DiceCategories? dice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: InkWell(
        onTap: () {
          context.router.push(
            CategoryDetailRoute(
              diceCategories: dice,
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(15),
          color: dice?.categoryColor != null
              ? _CardColor(dice!.categoryColor.toString())
              : ProjectColor.buzzIn.toColor,
          shape: RoundedRectangleBorder(
            borderRadius: context.borderRadiusLow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                dice?.categoryName ?? '',
                style: context.textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CardColor extends Color {
  _CardColor(
    String color,
  ) : super(int.parse('0xFF$color'));
}
