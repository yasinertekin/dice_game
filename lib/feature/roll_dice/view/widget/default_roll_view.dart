part of '../roll_dice_page.dart';

final class _DefaultRollView extends StatelessWidget {
  const _DefaultRollView({
    required this.widget,
    required AnimationController controller,
  }) : _controller = controller;

  final _RollDiceView widget;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: _RollDiceAppBar(
        widget.options ?? SubDices(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DiceLottie(controller: _controller),
            _RandomOptionsBuilder(widget: widget, controller: _controller),
          ],
        ),
      ),
    );
  }
}
