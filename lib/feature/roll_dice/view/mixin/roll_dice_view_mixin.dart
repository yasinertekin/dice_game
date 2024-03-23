part of '../roll_dice_page.dart';

mixin _RollDiceViewMixin on State<_RollDiceView> implements TickerProvider {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
