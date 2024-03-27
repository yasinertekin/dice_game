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
        confirmText: 'Seç',
        cancelText: 'İptal',
        barrierColor: Colors.black.withOpacity(0.5),
        barrierLabel: 'Tarih Seç',
        helpText: 'Doğum Tarihinizi Seçin',
        errorFormatText: 'Geçerli bir tarih seçin',
        errorInvalidText: 'Geçerli bir tarih seçin',
        fieldLabelText: 'Doğum Tarihi',
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
