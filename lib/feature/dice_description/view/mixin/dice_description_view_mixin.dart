part of '../dice_description_page.dart';

base mixin _DiceDescriptionViewMixin on State<_DiceDescriptionView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      _showDatePicker,
    );
  }

  Future<void> _showDatePicker() async {
    if (widget.categoryDices.isAdultContent ?? false) {
      final pickedDate = await showDatePicker(
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        initialDate: DateTime.now(),
        confirmText: LocaleKeys.dice_decription_alert_dialog_confirm_text.tr(),
        cancelText: LocaleKeys.dice_decription_alert_dialog_cancel_text.tr(),
        barrierColor: Colors.black.withOpacity(0.5),
        barrierLabel:
            LocaleKeys.dice_decription_alert_dialog_barrier_label.tr(),
        helpText: LocaleKeys.dice_decription_alert_dialog_help_text.tr(),
        errorFormatText:
            LocaleKeys.dice_decription_alert_dialog_error_format_text.tr(),
        errorInvalidText:
            LocaleKeys.dice_decription_alert_dialog_error_format_text.tr(),
        fieldLabelText:
            LocaleKeys.dice_decription_alert_dialog_field_label_text.tr(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        keyboardType: TextInputType.datetime,
      );
      if (pickedDate == null) {
        await Locator.appRouter.navigate(const HomeRoute());
        return;
      }

      final today = DateTime.now();
      final minimumDate =
          today.subtract(const Duration(days: 18 * 365)); // 18 years ago
      if (pickedDate.isAfter(minimumDate)) {
        _showAlerDialog();
        return;
      }
    }
  }

  void _showAlerDialog() {}
}
