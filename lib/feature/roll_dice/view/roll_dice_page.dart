import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/roll_dice/cubit/roll_dice_cubit.dart';
import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/core/model/sub_dices/sub_dices.dart';
import 'package:dice_game/product/utils/router/app_router.gr.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

part 'mixin/roll_dice_view_mixin.dart';
part 'widget/dice_lottie.dart';
part 'widget/random_options_title.dart';
part 'widget/reset_button.dart';
part 'widget/roll_dice_app_bar.dart';

@RoutePage()

/// RollDicePage is a page that shows a dice animation and random options.
final class RollDicePage extends StatelessWidget {
  /// RollDicePage is a page that shows a dice animation and random options.
  const RollDicePage({
    required this.options,
    super.key,
  });

  /// Options for the dice.
  final SubDices options;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RollDiceCubit(),
      child: _RollDiceView(
        options: options,
      ),
    );
  }
}

final class _RollDiceView extends StatefulWidget {
  const _RollDiceView({
    required this.options,
  });

  final SubDices? options;

  @override
  State<_RollDiceView> createState() => _RollDiceViewState();
}

final class _RollDiceViewState extends State<_RollDiceView>
    with _RollDiceViewMixin {
  @override
  Widget build(BuildContext context) {
    return widget.options?.name == 'Pişirme Yöntemi'
        ? Scaffold(
            backgroundColor: ProjectColor.silkyWhite.toColor,
            appBar: _RollDiceAppBar(
              widget.options ?? SubDices(),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _DiceLottie(controller: _controller),
                  _RandomOptionsBuilder(
                      widget: widget, controller: _controller),
                ],
              ),
            ),
          )
        : _DefaultRollView(
            widget: widget,
            controller: _controller,
          );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

final class _DefaultRollView extends StatelessWidget {
  const _DefaultRollView({
    required this.widget,
    required AnimationController controller,
  }) : _controller = controller;

  final _RollDiceView widget;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: _RollDiceAppBar(
        widget.options ?? SubDices(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DiceLottie(controller: _controller),
            _RandomOptionsBuilder(widget: widget, controller: _controller),
          ],
        ),
      ),
    );
  }
}

final class _RandomOptionsBuilder extends StatelessWidget {
  const _RandomOptionsBuilder({
    required this.widget,
    required AnimationController controller,
  }) : _controller = controller;

  final _RollDiceView widget;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RollDiceCubit, RollDiceState>(
      builder: (context, state) {
        final cubit = context.read<RollDiceCubit>();
        if (state == RollDiceState.completed) {
          final randomIndex = context
              .read<RollDiceCubit>()
              .getRandomIndex(widget.options?.options);
          return Column(
            children: [
              _RandomOptionsTitle(
                widget: widget,
                randomIndex: randomIndex,
              ),
              SizedBox(
                height: context.dynamicHeight(0.1),
              ),
              _ResetButton(cubit: cubit, controller: _controller),
            ],
          );
        } else {
          return const _EmptyWidget();
        }
      },
    );
  }
}

final class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
