part of '../home_page.dart';

final class _UserDiceCard extends StatelessWidget {
  const _UserDiceCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      height: context.dynamicHeight(0.2),
      child: InkWell(
        onTap: () {
          context.router.push(
            const UserDiceRoute(),
          );
        },
        child: Card(
          shape: _CardShape(context),
          color: ProjectColor.buzzIn.toColor,
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
          color: ProjectColor.black.toColor,
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
            color: ProjectColor.white.toColor,
            width: 4,
          ),
        );
}
