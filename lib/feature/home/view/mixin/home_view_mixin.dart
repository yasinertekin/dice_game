part of '../home_page.dart';

base mixin _HomeViewMixin on State<_HomeView> {
  @override
  void initState() {
    super.initState();
    loadAd();
    Future.microtask(
      _initializeData,
    );
    showAd();
  }

  void loadAd() {}

  Future<void> _initializeData() async {
    await context.read<HomeCubit>().getDiceModel(context);
  }

  Future<void> showAd() async {}
}
