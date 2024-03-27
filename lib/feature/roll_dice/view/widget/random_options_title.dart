part of '../roll_dice_page.dart';

final class _RandomOptionsTitle extends StatelessWidget {
  const _RandomOptionsTitle({
    required this.options,
    required this.randomIndex,
  });

  final List<Options>? options;
  final int randomIndex;

  @override
  Widget build(BuildContext context) {
    return Text(
      options?[randomIndex].name ?? '',
      textAlign: TextAlign.center,
      style: context.textTheme.displaySmall?.copyWith(
        color: ProjectColor.black.toColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
