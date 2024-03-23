part of '../roll_dice_page.dart';

final class _RollDiceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _RollDiceAppBar(
    this.options,
  );

  final SubDices options;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      title: Text(
        options.name ?? 'Zar At!',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
      leading: const CustomBackButton(
        pageRouteInfo: HomeRoute(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
