part of '../splash_page.dart';

// ignore: library_private_types_in_public_api
base mixin SplashViewMixin on State<_SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.router.replace(const HomeRoute());
    });
  }
}
