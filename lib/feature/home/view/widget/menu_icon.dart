part of '../home_page.dart';

final class _MenuIcon extends StatelessWidget {
  const _MenuIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomSvg(
        assetPath: ProjectAssets.icMenu.toSvg,
        color: ProjectColor.black.toColor,
      ),
      onPressed: () {},
    );
  }
}
