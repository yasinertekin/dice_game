part of '../home_page.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      title: const Text('Home Page'),
      automaticallyImplyLeading: false,
      bottom: const _AppbarBottom(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _AppbarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppbarBottom();

  @override
  Widget build(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: _CustomDivider(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
