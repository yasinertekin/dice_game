import 'package:auto_route/auto_route.dart';
import 'package:dice_game/feature/settings/cubit/dice_type_cubit.dart';
import 'package:dice_game/product/core/extension/context_extension.dart';
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
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.dynamicHeight(0.15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: DiceType.values.length,
              itemBuilder: (BuildContext context, int index) {
                final diceType = DiceType.values[index];
                return _DiceLottie(diceType: diceType);
              },
            ),
          ),
        ],
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
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DiceTypeCubit>().changeDice(widget.diceType);
        _controller.forward(from: 0);
      },
      child: Card(
        color: context.read<DiceTypeCubit>().state == widget.diceType
            ? Colors.blue
            : Colors.white,
        child: SizedBox(
          width: context.dynamicWidth(0.2),
          height: context.dynamicHeight(0.12),
          child: Center(
            child: Lottie.asset(
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
      ),
    );
  }
}
