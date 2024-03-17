part of '../home_page.dart';

final class _HomeTitle extends StatelessWidget {
  const _HomeTitle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.07),
      child: Text(
        'Kategoriler',
        style: context.textTheme.bodyLarge?.copyWith(
          color: ProjectColor.black.toColor,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
    );
  }
}
