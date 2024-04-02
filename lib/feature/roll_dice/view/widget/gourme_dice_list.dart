part of '../roll_dice_page.dart';

final class _GourmeDiceList extends StatelessWidget {
  const _GourmeDiceList({
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
        final subDices = widget.categoryDices.subDices;

        if (state == RollDiceState.completed) {
          return Padding(
            padding: context.paddingAllLow,
            child: Column(
              children: [
                _GourmeGridViewBuilder(subDices: subDices, cubit: cubit),
                _ResetButton(cubit: cubit, controller: _controller),
              ],
            ),
          );
        } else {
          return const _EmptyWidget();
        }
      },
    );
  }
}

final class _GourmeGridViewBuilder extends StatelessWidget {
  const _GourmeGridViewBuilder({
    required this.subDices,
    required this.cubit,
  });

  final List<SubDices>? subDices;
  final RollDiceCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: subDices?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final subDice = subDices?[index];
          final randomIndex = cubit.getRandomIndex(subDice?.options);
          final randomOption = subDice?.options?[randomIndex].name;
          return _GourmetDiceCard(subDice: subDice, randomOption: randomOption);
        },
      ),
    );
  }
}

final class _GourmetDiceCard extends StatelessWidget {
  const _GourmetDiceCard({
    required this.subDice,
    required this.randomOption,
  });

  final SubDices? subDice;
  final String? randomOption;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            subDice?.name ?? '',
            style: context.textTheme.titleMedium?.copyWith(
              color: ProjectColor.black.toColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            randomOption ?? '',
            style: context.textTheme.titleMedium?.copyWith(
              color: ProjectColor.black.toColor,
            ),
          ),
        ],
      ),
    );
  }
}
