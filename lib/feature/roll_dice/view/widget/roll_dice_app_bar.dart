part of '../roll_dice_page.dart';

final class _RollDiceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _RollDiceAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      title: Text(
        'Zar At',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
