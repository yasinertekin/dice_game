part of '../dice_description_page.dart';

final class _DarkOverlayContainer extends StatelessWidget {
  const _DarkOverlayContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(
        0.7,
      ), // 0.5 opaklık seviyesini ayarlayabilirsiniz
    );
  }
}
