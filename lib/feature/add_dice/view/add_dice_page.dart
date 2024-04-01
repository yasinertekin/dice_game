import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/add_dice/cubit/add_dice_cubit.dart';
import 'package:dice_game/feature/add_dice/cubit/svg_files_cubit.dart';
import 'package:dice_game/feature/user_dice/cubit/user_dice_cubit.dart';
import 'package:dice_game/locator.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/extension/snack_bar_extension.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/core/model/sub_dices/sub_dices.dart';
import 'package:dice_game/product/utils/localization/locale_keys.g.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/image/custom_svg.dart';
import 'package:dice_game/product/widget/text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mixin/add_dice_mixin.dart';
part 'widget/add_icon.dart';
part 'widget/add_name_view.dart';
part 'widget/add_options.dart';

@RoutePage()

/// AddDicePage
final class AddDicePage extends StatelessWidget {
  // ignore: public_member_api_docs
  const AddDicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SVGFilesCubit>(
          create: (_) =>
              SVGFilesCubit()..listSVGFiles(_IconPath.diceIcon._path),
        ),
        BlocProvider(
          create: (_) => AddDiceCubit(),
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
              pageController: _pageController,
              nameController: _nameController,
              descriptionController: _descriptionController,
            );
          case _PageEnum.addOptions:
            return _AddOptions(
              optionController: _optionController,
              pageController: _pageController,
            );
          case _PageEnum.addIcon:
            return const _AddIcon();
        }
      },
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
      return LocaleKeys.add_dice_dice_name_validation.tr();
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
      return LocaleKeys.add_dice_dice_description_validation.tr();
    }
    return null;
  }
}
