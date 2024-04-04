part of '../settings_page.dart';

base mixin _PremiumOptionsMixin<StatelessWidget extends _PremiumOptions> {
  void _removeAdsShowActionSheet(BuildContext context) {
    if (Platform.isIOS) {
      _removeAdsShowCupertinoModel(context);
    } else {
      _removeAdsShowMaterialModel(context);
    }
  }

  void _removeAdsShowMaterialModel(BuildContext context) {}

  void _removeAdsShowCupertinoModel(BuildContext context) {}

  void _buyPremiumShowActionSheet(BuildContext context) {
    if (Platform.isIOS) {
      _buyPremiumShowCupertinoModel(context);
    } else {
      _buyPremiumShowMaterialModel(context);
    }
  }

  void _buyPremiumShowMaterialModel(BuildContext context) {}

  void _buyPremiumShowCupertinoModel(BuildContext context) {}
}
