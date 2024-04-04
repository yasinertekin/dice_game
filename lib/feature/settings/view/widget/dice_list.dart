part of '../settings_page.dart';

final class _DiceList extends StatelessWidget {
  const _DiceList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const _CustomSliverDelegate(),
      itemCount: DiceType.values.length,
      itemBuilder: (BuildContext context, int index) {
        final diceType = DiceType.values[index];
        return _DiceLottie(diceType: diceType);
      },
    );
  }
}

final class _CustomSliverDelegate
    extends SliverGridDelegateWithFixedCrossAxisCount {
  const _CustomSliverDelegate()
      : super(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        );
}
