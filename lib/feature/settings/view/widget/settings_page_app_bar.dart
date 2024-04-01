part of '../settings_page.dart';

final class _SettingsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SettingsPageAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        _ChangeLanguageButton(),
      ],
      leading: const CustomBackButton(),
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      title: CustomText(
        text: LocaleKeys.settings_settings_title,
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _ChangeLanguageButton extends StatelessWidget {
  const _ChangeLanguageButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _changeLanguage(context),
      icon: const Icon(Icons.language),
    );
  }

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
