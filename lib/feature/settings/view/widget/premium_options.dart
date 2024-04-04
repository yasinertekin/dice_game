part of '../settings_page.dart';

final class _PremiumOptions extends StatelessWidget with _PremiumOptionsMixin {
  const _PremiumOptions();

  @override
  void _removeAdsShowMaterialModel(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return const _CustomMaterialCheckboxListTile();
      },
    );
  }

  @override
  void _removeAdsShowCupertinoModel(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return const _RemoveAdsCupertinoActionSheet();
      },
    );
  }

  @override
  void _buyPremiumShowMaterialModel(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return const _CustomMaterialCheckboxListTile();
      },
    );
  }

  @override
  void _buyPremiumShowCupertinoModel(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return const _BuyPremiumCupertinoActionSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _PremiumButton(
            text: LocaleKeys.settings_remove_ads,
            onTap: () => _removeAdsShowActionSheet(context),
          ),
        ),
        SizedBox(width: context.lowValue),
        Expanded(
          child: _PremiumButton(
            text: LocaleKeys.settings_buy_premium,
            onTap: () => _buyPremiumShowActionSheet(context),
          ),
        ),
      ],
    );
  }
}
