import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/settings/cubit/dice_type_cubit.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
import 'package:dice_game/product/widget/button/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: ProjectColor.concreteSideWalk.toColor,
        title: Text(
          'Settings',
          style: context.textTheme.titleLarge?.copyWith(
            color: ProjectColor.white.toColor,
          ),
        ),
      ),
      body: Padding(
        padding: context.paddingAllLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Dice',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: DiceType.values.length,
                itemBuilder: (BuildContext context, int index) {
                  final diceType = DiceType.values[index];
                  return _DiceLottie(diceType: diceType);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _DiceLottie extends StatefulWidget {
  const _DiceLottie({
    required this.diceType,
  });

  final DiceType diceType;

  @override
  State<_DiceLottie> createState() => _DiceLottieState();
}

final class _DiceLottieState extends State<_DiceLottie>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<DiceTypeCubit>().changeDiceType(widget.diceType);
        await _controller.forward(from: 0);
      },
      child: BlocBuilder<DiceTypeCubit, DiceState>(
        builder: (context, state) {
          return Card(
            color: state.selectedDice == widget.diceType
                ? ProjectColor.buzzIn.toColor
                : ProjectColor.white.toColor,
            child: SizedBox(
              width: context.dynamicWidth(0.2),
              height: context.dynamicHeight(0.12),
              child: Center(
                child: Lottie.asset(
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                  },
                  widget.diceType.toLottie,
                  controller: _controller,
                  fit: BoxFit.contain,
                  repeat: false,
                  animate: false,
                  width: context.dynamicHeight(0.2),
                  height: context.dynamicHeight(0.1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
