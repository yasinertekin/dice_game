part of '../home_page.dart';

final class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomSvg(
        assetPath: ProjectAssets.heard.toSvg,
      ),
      onPressed: () {},
    );
  }
}
