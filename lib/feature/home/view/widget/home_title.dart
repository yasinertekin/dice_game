part of '../home_page.dart';

final class _HomeTitle extends StatelessWidget {
  const _HomeTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Kategoriler',
      style: context.textTheme.displaySmall?.copyWith(
        color: ProjectColor.black.color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
