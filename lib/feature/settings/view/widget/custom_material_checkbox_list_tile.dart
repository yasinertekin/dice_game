part of '../settings_page.dart';

final class _CustomMaterialCheckboxListTile extends StatelessWidget {
  const _CustomMaterialCheckboxListTile();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      child: Center(
        child: CheckboxListTile(
          value: true,
          onChanged: null,
          title: CustomText(
            text: LocaleKeys.settings_remove_ads_premium_features,
            style: TextStyle(
              color: ProjectColor.black.toColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
