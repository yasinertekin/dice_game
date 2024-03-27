part of '../roll_dice_page.dart';

final class _GourmetDice extends StatelessWidget {
  const _GourmetDice({
    required this.widget,
    required AnimationController controller,
  }) : _controller = controller;

  final _RollDiceView widget;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          widget.categoryDices.diceName ?? '',
          style: context.textTheme.headlineMedium?.copyWith(
            color: ProjectColor.silkyWhite.toColor,
          ),
        ),
        backgroundColor: ProjectColor.concreteSideWalk.toColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DiceLottie(
              controller: _controller,
            ),
            _GourmeDiceList(widget: widget, controller: _controller),
          ],
        ),
      ),
    );
  }
}
