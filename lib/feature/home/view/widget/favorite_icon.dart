part of '../home_page.dart';

final class _FavoriteIcon extends StatelessWidget with NavigationManager {
  const _FavoriteIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomSvg(
        assetPath: ProjectAssets.icHeard.toSvg,
      ),
      onPressed: () => navigatePush(const FavoriteRoute()),
    );
  }
}
