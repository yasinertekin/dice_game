part of '../roll_dice_page.dart';

final class _RandomOptionsTitle extends StatelessWidget {
  const _RandomOptionsTitle({
    required this.widget,
    required this.randomIndex,
  });

  final _RollDiceView widget;
  final int randomIndex;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.options?.options?[randomIndex].name ?? '',
      textAlign: TextAlign.center,
      style: context.textTheme.titleLarge?.copyWith(
        color: ProjectColor.black.toColor,
      ),
    );
  }
}
