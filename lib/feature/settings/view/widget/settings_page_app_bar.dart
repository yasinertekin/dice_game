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
      title: const _AppBarTitle(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: LocaleKeys.settings_settings_title,
      style: context.textTheme.titleLarge?.copyWith(
        color: ProjectColor.white.toColor,
      ),
    );
  }
}

final class _ChangeLanguageButton extends StatelessWidget
    with _ChangeLanguageButtonMixin {
  const _ChangeLanguageButton();

  @override
  void customShowCupertinoModalPopup(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return _CustomCupertinoActionSheet(cubit: cubit);
      },
    );
  }

  @override
  void customShowMaterialModalBottomSheet(BuildContext context) {
    super.customShowMaterialModalBottomSheet(context);
    final cubit = context.read<HomeCubit>();
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _CustomMaterialActionSheet(cubit: cubit);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        /// CupertinoContextMenu is used for iOS devices.
        if (Platform.isIOS) {
          customShowCupertinoModalPopup(context);
        } else {
          /// PopupMenuButton is used for Android devices.
          customShowMaterialModalBottomSheet(context);
        }
      },
      icon: const _LanguageIcon(),
    );
  }
}

final class _LanguageIcon extends StatelessWidget {
  const _LanguageIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.language);
  }
}
