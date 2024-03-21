import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/add_dice/cubit/add_dice_cubit.dart';
import 'package:dice_game/feature/add_dice/cubit/svg_files_cubit.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mixin/add_dice_mixin.dart';

@RoutePage()
final class AddDicePage extends StatelessWidget {
  const AddDicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SVGFilesCubit>(
          create: (context) =>
              SVGFilesCubit()..listSVGFiles(_IconPath.diceIcon._path),
        ),
        BlocProvider(
          create: (context) => AddDiceCubit(),
        ),
      ],
      child: const _AddDiceView(),
    );
  }
}

final class _AddDiceView extends StatefulWidget {
  const _AddDiceView();

  @override
  State<_AddDiceView> createState() => _AddDiceViewState();
}

final class _AddDiceViewState extends State<_AddDiceView> with _AddDicemixin {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _PageEnum.values.length,
      itemBuilder: (context, index) {
        switch (_PageEnum.values[index]) {
          case _PageEnum.addName:
            return _AddNameView(
              formKey: _formKey,
              pageController: _pageController,
              nameController: _nameController,
              descriptionController: _descriptionController,
            );
          case _PageEnum.addOptions:
            return const _AddOptions();
          case _PageEnum.addIcon:
            return const _AddIcon();
        }
      },
    );
  }
}

final class _AddOptions extends StatelessWidget {
  const _AddOptions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zar Seçenekleri'),
      ),
      body: BlocSelector<AddDiceCubit, CategoryDices, CategoryDices>(
        selector: (state) => state,
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.subDices?.length,
            itemBuilder: (BuildContext context, int index) {
              return null;

              // return ListTile(
              //   title: Text(state.subDices![index].diceName),
              //   subtitle: Text(state.subDices![index].description),
              // );
            },
          );
        },
      ),
    );
  }
}

final class _AddIcon extends StatelessWidget {
  const _AddIcon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zar İkonu'),
      ),
      body: const Center(
        child: Text('Add Icon'),
      ),
    );
  }
}

final class _AddNameView extends StatelessWidget {
  const _AddNameView({
    required GlobalKey<FormState> formKey,
    required this.pageController,
    required this.nameController,
    required this.descriptionController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final PageController pageController;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zar Ekle'),
      ),
      body: Padding(
        padding: context.paddingAllLow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Icon(
              Icons.casino,
              size: context.dynamicHeight(0.2),
            ),
            const Spacer(),
            _CustomForm(
              formKey: _formKey,
              nameController: nameController,
              descriptionController: descriptionController,
            ),
            SizedBox(height: context.lowValue),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<AddDiceCubit, CategoryDices>(
                builder: (context, state) => ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      state.copyWith(
                        diceName: nameController.text,
                        description: descriptionController.text,
                      );
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: const Text('Devam Et'),
                ),
              ),
            ),
            const Spacer(),
          ],
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
          SizedBox(height: context.lowValue),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            controller: descriptionController,
            validator: (value) => _BodyValidator(value: value!).validate,
            decoration: const _CustomInputDecoration(
              labelText: 'Zar Açıklaması',
            ),
          ),
        ],
      ),
    );
  }
}

enum _IconPath {
  diceIcon('assets/icon/dice_icon/');

  final String _path;

  // ignore: sort_constructors_first
  const _IconPath(this._path);
}

enum _PageEnum { addName, addOptions, addIcon }

@immutable
final class _CustomInputDecoration extends InputDecoration {
  const _CustomInputDecoration({
    required String labelText,
  }) : super(
          labelText: labelText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
}

/// Validator
@immutable
abstract interface class _Validator {
  const _Validator({required this.value});

  String? get validate;
  final String? value;
}

@immutable
final class _TitleValidator extends _Validator {
  const _TitleValidator({required String value}) : super(value: value);
  @override
  String? get validate {
    if (value == null || value!.isEmpty) {
      return 'Lütfen bir zar adı giriniz';
    }
    return null;
  }
}

@immutable
final class _BodyValidator extends _Validator {
  const _BodyValidator({required String value}) : super(value: value);
  @override
  String? get validate {
    if (value == null || value!.isEmpty) {
      return 'Lütfen bir açıklama giriniz';
    }
    return null;
  }
}
