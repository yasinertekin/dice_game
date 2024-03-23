part of '../add_dice_page.dart';

mixin _AddDicemixin on State<_AddDiceView> {
  late final PageController _pageController;
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _optionController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _optionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _optionController.dispose();
  }
}
