part of '../roll_dice_page.dart';

final class _ResetButton extends StatelessWidget {
  const _ResetButton({
    required this.cubit,
    required AnimationController controller,
  }) : _controller = controller;

  final RollDiceCubit cubit;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ProjectColor.concreteSideWalk.toColor,
          ),
          onPressed: () async {
            _controller
              ..reset()
              ..forward();
            cubit.resetAnimation();
            await context.read<RollDiceCounterCubit>().showAd();
          },
          child: CustomText(
            text: LocaleKeys.dice_decription_roll_again,
            style: context.textTheme.labelLarge?.copyWith(
              color: ProjectColor.white.toColor,
            ),
          ),
        ),
      ),
    );
  }
}
  // style: context.textTheme.labelLarge?.copyWith(
  //             color: ProjectColor.white.toColor,
  //           ),