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
      appBar: _GourmetDiceAppBar(widget: widget),
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

final class _GourmetDiceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _GourmetDiceAppBar({
    required this.widget,
  });

  final _RollDiceView widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
