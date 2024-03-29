part of '../settings_page.dart';

final class _SelectDiceText extends StatelessWidget {
  const _SelectDiceText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Zar Seç',
      style: context.textTheme.titleLarge?.copyWith(
        color: ProjectColor.black.toColor,
      ),
    );
  }
}
