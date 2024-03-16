part of '../home_page.dart';

final class _MenuIcon extends StatelessWidget {
  const _MenuIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
        size: 50,
        color: ProjectColor.black.color,
      ),
      onPressed: () {},
    );
  }
}
