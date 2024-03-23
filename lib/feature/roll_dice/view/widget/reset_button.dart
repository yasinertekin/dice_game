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
    return SizedBox(
      width: context.dynamicWidth(0.5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColor.concreteSideWalk.toColor,
        ),
        onPressed: () {
          cubit.resetAnimation();
          _controller
            ..reset()
            ..forward();
        },
        child: Text(
          'Tekrar At',
          style: context.textTheme.labelLarge?.copyWith(
            color: ProjectColor.white.toColor,
          ),
        ),
      ),
    );
  }
}
