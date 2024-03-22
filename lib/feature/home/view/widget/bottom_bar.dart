part of '../home_page.dart';

final class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: const SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _FavoriteIcon(),
                _MenuIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
