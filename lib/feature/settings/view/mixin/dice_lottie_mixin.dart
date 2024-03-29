part of '../settings_page.dart';

base mixin _DiceLottieMixin on State<_DiceLottie> implements TickerProvider {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
