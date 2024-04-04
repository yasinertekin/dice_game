part of '../settings_page.dart';

final class _RemoveAdsCupertinoActionSheet extends StatelessWidget {
  const _RemoveAdsCupertinoActionSheet();

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const CustomText(
        text: LocaleKeys.settings_remove_ads,
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Locator.appRouter.popForced();
          },
          child: const CustomText(text: LocaleKeys.settings_buy),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Locator.appRouter.popForced();
        },
        isDefaultAction: true,
        child: const CustomText(
          text: LocaleKeys.settings_cancel,
        ),
      ),
    );
  }
}
