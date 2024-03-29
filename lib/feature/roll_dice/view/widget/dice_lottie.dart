part of '../roll_dice_page.dart';

final class _DiceLottie extends StatelessWidget {
  const _DiceLottie({
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RollDiceCubit, RollDiceState>(
      builder: (context, state) {
        return Visibility(
          visible: state == RollDiceState.initial,
          child: Lottie.asset(
            context.read<DiceTypeCubit>().state.selectedDice.toLottie,
            width: context.dynamicWidth(0.55),
            height: context.dynamicHeight(0.55),
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward()
                ..addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    context.read<RollDiceCubit>().completeAnimation();
                  }
                });
            },
          ),
        );
      },
    );
  }
}
