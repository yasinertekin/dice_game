part of '../home_page.dart';

final class _UserDiceCard extends StatelessWidget {
  const _UserDiceCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      height: context.dynamicHeight(0.2),
      child: InkWell(
        onTap: () => RouterManager.routes.go(
          RoutePaths.userDice.path,
          extra: 'My Parameter',
        ),
        child: Card(
          shape: _CardShape(context),
          color: ProjectColor.buzzIn.color,
          child: const _CardTitle(),
        ),
      ),
    );
  }
}

final class _CardTitle extends StatelessWidget {
  const _CardTitle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Senin Zarların',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.black.color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

final class _CardShape extends RoundedRectangleBorder {
  _CardShape(BuildContext context)
      : super(
          borderRadius: context.borderRadiusLow,
          side: BorderSide(
            color: ProjectColor.white.color,
            width: 4,
          ),
        );
}
