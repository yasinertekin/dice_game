part of '../settings_page.dart';

final class _SettingsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SettingsPageAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const CustomBackButton(),
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      title: Text(
        'Ayarlar',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
