import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/home/cubit/home_cubit.dart';
import 'package:dice_game/feature/home/cubit/state/home_state.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/model/dice_categories/dice_categories.dart';
import 'package:dice_game/product/model/dice_model/dice_model.dart';
import 'package:dice_game/product/router/app_router.gr.dart';
import 'package:dice_game/product/service/json_service.dart';
import 'package:dice_game/product/widget/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

part 'widget/bottom_bar.dart';
part 'widget/custom_divider.dart';
part 'widget/favorite_icon.dart';
part 'widget/home_app_bar.dart';
part 'widget/home_category_card.dart';
part 'widget/home_title.dart';
part 'widget/menu_icon.dart';
part 'widget/user_dice_card.dart';

/// HomePage
@RoutePage()
final class HomePage extends StatelessWidget {
  /// HomePage constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        JsonService(),
      ),
      child: const _HomeView(),
    );
  }
}

final class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: const _HomeAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _HomeTitle(),
              const _DiceGategoryList(),
              const _UserDiceCard(),
              context.sized.emptySizedHeightBoxNormal,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}

final class _DiceGategoryList extends StatelessWidget {
  const _DiceGategoryList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case HomeStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case HomeStatus.loaded:
            return _CategoryGridViewBuilder(
              state.diceModel ?? DiceModel(),
            );
          case HomeStatus.error:
            return Text(
              'Hata oluştu, lütfen tekrar deneyin ${HomeStatus.error.name}',
            );
        }
      },
    );
  }
}

final class _CategoryGridViewBuilder extends StatelessWidget {
  const _CategoryGridViewBuilder(
    this.diceModel,
  );

  final DiceModel diceModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.7),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: diceModel.diceCategories?.length ?? 0,
        itemBuilder: (context, index) {
          final dice = diceModel.diceCategories?[index];
          return _HomeCategoryCard(
            dice: dice,
            index: index,
          );
        },
      ),
    );
  }
}
