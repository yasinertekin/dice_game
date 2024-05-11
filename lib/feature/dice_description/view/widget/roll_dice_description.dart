part of '../dice_description_page.dart';

final class _RollDiceDescription extends StatelessWidget {
  const _RollDiceDescription({
    required this.categoryDices,
  });

  final CategoryDices categoryDices;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingAllLow,
        child: SizedBox(
          height: context.dynamicHeight(0.35),
          child: SingleChildScrollView(
            child: Text(
              textAlign: TextAlign.center,
              categoryDices.description ?? '',
              style: context.textTheme.titleMedium?.copyWith(
                color: ProjectColor.white.toColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
