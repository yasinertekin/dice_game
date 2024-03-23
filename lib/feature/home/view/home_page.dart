import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/home/cubit/home_cubit.dart';
import 'package:dice_game/feature/home/cubit/state/home_state.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/mixin/navigation_manager.dart';
import 'package:dice_game/product/core/model/categories/categories.dart';
import 'package:dice_game/product/core/model/category/category.dart';
import 'package:dice_game/product/core/service/json_service.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/image/custom_svg.dart';
import 'package:dice_game/product/widget/loading/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: const _HomeAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _HomeTitle(),
            _DiceGategoryList(),
            _UserDiceCard(),
            _BottomBar(),
          ],
        ),
      ),
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
            return const CustomCircularProgressIndicator();
          case HomeStatus.loading:
            return const CustomCircularProgressIndicator();
          case HomeStatus.loaded:
            return _CategoryGridViewBuilder(
              state.diceModel ?? Category(),
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

  final Category diceModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.95),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 6,
        ),
        itemCount: diceModel.categories?.length ?? 0,
        itemBuilder: (context, index) {
          final dice = diceModel.categories?[index];
          return _HomeCategoryCard(
            dice: dice,
            index: index,
          );
        },
      ),
    );
  }
}
