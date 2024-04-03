import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/home/cubit/home_cubit.dart';
import 'package:dice_game/feature/settings/cubit/dice_type_cubit.dart';
import 'package:dice_game/locator.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/utils/localization/locale_keys.g.dart';
import 'package:dice_game/product/utils/localization/localization_manager.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:dice_game/product/widget/text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

part 'mixin/change_language_button_mixin.dart';
part 'mixin/dice_lottie_mixin.dart';
part 'widget/cupertino_view.dart';
part 'widget/custom_cupertino_action_sheet.dart';
part 'widget/custom_material_action_sheet.dart';
part 'widget/dice_list.dart';
part 'widget/dice_lottie.dart';
part 'widget/material_model_view.dart';
part 'widget/selected_dice_text.dart';
part 'widget/settings_page_app_bar.dart';

@RoutePage()
final class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SettingsView();
  }
}

final class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: const _SettingsPageAppBar(),
      body: const _ScaffoldBody(),
    );
  }
}

final class _ScaffoldBody extends StatelessWidget {
  const _ScaffoldBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SelectDiceText(),
            _DiceList(),
          ],
        ),
      ),
    );
  }
}
