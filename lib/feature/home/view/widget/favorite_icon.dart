part of '../home_page.dart';

final class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        size: 50,
        color: ProjectColor.black.color,
      ),
      onPressed: () {},
    );
  }
}
