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
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: AppBar(
        title: const Text(
          'Zar Ekle',
        ),
        backgroundColor: ProjectColor.concreteSideWalk.toColor,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: context.paddingAllLow,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.dynamicHeight(0.15),
              ),
              Icon(
                Icons.casino,
                size: context.dynamicHeight(0.2),
              ),
              _CustomForm(
                formKey: formKey,
                nameController: nameController,
                descriptionController: descriptionController,
              ),
              SizedBox(height: context.lowValue),
              BlocBuilder<AddDiceCubit, CategoryDices>(
                builder: (context, state) {
                  final cubit = context.read<AddDiceCubit>();
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
                          await cubit
                              .setDescription(descriptionController.text);

                          await pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        'Devam Et',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: ProjectColor.white.toColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
            controller: nameController,
            validator: (value) => _TitleValidator(value: value!).validate,
            decoration: const _CustomInputDecoration(
              labelText: 'Zar Adı',
            ),
          ),
          SizedBox(height: context.highValue),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            controller: descriptionController,
            validator: (value) => _BodyValidator(value: value!).validate,
            decoration: const _CustomInputDecoration(
              labelText: 'Zar Açıklaması',
            ),
          ),
          SizedBox(height: context.highValue),
        ],
      ),
    );
  }
}
