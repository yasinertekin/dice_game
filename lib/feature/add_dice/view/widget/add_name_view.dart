part of '../add_dice_page.dart';

final class _AddNameView extends StatelessWidget {
  _AddNameView({
    required this.pageController,
    required this.nameController,
    required this.descriptionController,
  });

  final PageController pageController;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddDiceCubit>();
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: const _AddNameAppBar(),
      body: Padding(
        padding: context.paddingAllLow,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.dynamicHeight(0.15),
              ),
              const _CasinoIcon(),
              _CustomForm(
                formKey: formKey,
                nameController: nameController,
                descriptionController: descriptionController,
              ),
              SizedBox(height: context.lowValue),
              _ContinueButton(
                formKey: formKey,
                cubit: cubit,
                nameController: nameController,
                descriptionController: descriptionController,
                pageController: pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _AddNameAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _AddNameAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: LocaleKeys.add_dice_add_dice_title,
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _ContinueButton extends StatelessWidget {
  const _ContinueButton({
    required this.formKey,
    required this.cubit,
    required this.nameController,
    required this.descriptionController,
    required this.pageController,
  });

  final GlobalKey<FormState> formKey;
  final AddDiceCubit cubit;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.07),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ProjectColor.concreteSideWalk.toColor,
        ),
        onPressed: () async {
          if (formKey.currentState?.validate() ?? true) {
            await cubit.setDiceName(nameController.text);
            await cubit.setDescription(descriptionController.text);

            await pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        child: CustomText(
          text: LocaleKeys.add_dice_button_continue,
          style: context.textTheme.labelLarge?.copyWith(
            color: ProjectColor.white.toColor,
          ),
        ),
      ),
    );
  }
}

final class _CasinoIcon extends StatelessWidget {
  const _CasinoIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.casino,
      size: context.dynamicHeight(0.2),
    );
  }
}

final class _CustomForm extends StatelessWidget {
  const _CustomForm({
    required this.formKey,
    required this.nameController,
    required this.descriptionController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            autofocus: true,
            controller: nameController,
            validator: (value) => _TitleValidator(value: value!).validate,
            decoration: _CustomInputDecoration(
              labelText: LocaleKeys.add_dice_dice_name.tr(),
            ),
          ),
          SizedBox(height: context.highValue),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            controller: descriptionController,
            validator: (value) => _BodyValidator(value: value!).validate,
            decoration: _CustomInputDecoration(
              labelText: LocaleKeys.add_dice_dice_description.tr(),
            ),
          ),
          SizedBox(height: context.highValue),
        ],
      ),
    );
  }
}
