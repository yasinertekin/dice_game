part of '../home_page.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      title: const _AppLogo(),
      automaticallyImplyLeading: false,
      bottom: const _AppbarBottom(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ProjectAssets.imgAppLogo.toPng,
      height: context.dynamicHeight(0.05),
      fit: BoxFit.fill,
    );
  }
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
