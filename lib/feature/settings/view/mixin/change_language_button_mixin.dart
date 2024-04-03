part of '../settings_page.dart';

base mixin _ChangeLanguageButtonMixin<
    StatelessWidget extends _ChangeLanguageButton> {
  void customShowCupertinoModalPopup(BuildContext context) {}

  void customShowMaterialModalBottomSheet(BuildContext context) {}

  Future<void> _changeLanguage(BuildContext context) async {
    if (context.locale == Locales.tr.locale) {
      await ProductLocalization.updateLanguage(
        context: context,
        value: Locales.en,
      );
      await context.read<HomeCubit>().getDiceModel(context);
    } else if (context.locale == Locales.en.locale) {
      await ProductLocalization.updateLanguage(
        context: context,
        value: Locales.tr,
      );
      await context.read<HomeCubit>().getDiceModel(context);
    } else {
      await ProductLocalization.updateLanguage(
        context: context,
        value: Locales.en,
      );
      await context.read<HomeCubit>().getDiceModel(context);
    }
  }
}
