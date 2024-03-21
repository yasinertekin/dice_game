part of '../add_dice_page.dart';

mixin _AddDicemixin on State<_AddDiceView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final PageController _pageController;
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
  }
}
