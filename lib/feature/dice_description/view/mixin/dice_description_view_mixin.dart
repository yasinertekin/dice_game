part of '../dice_description_page.dart';

base mixin _DiceDescriptionViewMixin on State<_DiceDescriptionView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      _showDatePicker,
    );
  }

  void _showDatePicker() {}

  void _showAlerDialog() {}
}
