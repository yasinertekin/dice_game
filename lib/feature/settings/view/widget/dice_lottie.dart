part of '../settings_page.dart';

final class _DiceLottie extends StatefulWidget {
  const _DiceLottie({
    required this.diceType,
  });

  final DiceType diceType;

  @override
  State<_DiceLottie> createState() => _DiceLottieState();
}

final class _DiceLottieState extends State<_DiceLottie>
    with SingleTickerProviderStateMixin, _DiceLottieMixin {
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
