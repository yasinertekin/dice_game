part of '../settings_page.dart';

final class _BuyPremiumCupertinoActionSheet extends StatelessWidget {
  const _BuyPremiumCupertinoActionSheet();

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: CustomText(
        text: LocaleKeys.settings_buy_premium,
        style: TextStyle(
          color: ProjectColor.black.toColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: CustomText(
            text: LocaleKeys.settings_remove_ads_premium_features,
            style: TextStyle(
              color: ProjectColor.black.toColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: CustomText(
            text: LocaleKeys.settings_remove_ads_premium_features_once,
            style: TextStyle(
              color: ProjectColor.black.toColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: CustomText(
          text: LocaleKeys.settings_cancel,
          style: TextStyle(
            color: ProjectColor.black.toColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
