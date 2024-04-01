part of '../add_dice_page.dart';

final class _AddOptions extends StatelessWidget {
  const _AddOptions({
    required this.optionController,
    required this.pageController,
  });
  final TextEditingController optionController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddDiceCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: ProjectColor.concreteSideWalk.toColor,
        onPressed: () {
          _navigateAndCheckOptionsLength(cubit, context);
        },
        child: Icon(
          Icons.arrow_forward,
          color: ProjectColor.white.toColor,
        ),
      ),
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: const _AddOptionsAppBar(),
      body: Padding(
        padding: context.paddingAllLow,
        child: Column(
          children: [
            SizedBox(height: context.dynamicHeight(0.05)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _OptionsTextField(optionController: optionController),
                _AddOptionsButton(optionController: optionController),
              ],
            ),
            SizedBox(height: context.dynamicHeight(0.02)),
            const _OptionsList(),
          ],
        ),
      ),
    );
  }

  void _navigateAndCheckOptionsLength(
    AddDiceCubit cubit,
    BuildContext context,
  ) {
    cubit.state.subDices?.first.options?.isEmpty ?? true
        ? context.showCustomSnackBar(message: 'En az bir seçenek ekleyin')
        : pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
  }
}

final class _OptionsTextField extends StatelessWidget {
  const _OptionsTextField({
    required this.optionController,
  });

  final TextEditingController optionController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      child: TextField(
        autofocus: true,
        onEditingComplete: () {
          if (optionController.text.isEmpty) return;

          context.read<AddDiceCubit>().updateOptions([optionController.text]);
          optionController.clear();
        },
        controller: optionController,
        keyboardType: TextInputType.text,
        decoration: const _CustomInputDecoration(
          labelText: 'Seçenek Adı',
        ),
      ),
    );
  }
}

final class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDiceCubit, CategoryDices>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.subDices?.first.options?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                color: ProjectColor.concreteSideWalk.toColor,
                child: ListTile(
                  title: Text(
                    state.subDices?.first.options?[index].name ?? '',
                    style: context.textTheme.bodyLarge,
                  ),
                  trailing: _DeleteOptions(
                    optionId: state.subDices?.first.options?[index].id ?? '',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

final class _DeleteOptions extends StatelessWidget {
  const _DeleteOptions({
    required this.optionId,
  });
  final String optionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDiceCubit, CategoryDices>(
      builder: (context, state) {
        final cubit = context.read<AddDiceCubit>();
        return IconButton(
          onPressed: () {
            cubit.deleteOptionById(optionId);
          },
          icon: Icon(
            Icons.delete,
            color: ProjectColor.white.toColor,
          ),
        );
      },
    );
  }
}

final class _AddOptionsButton extends StatelessWidget {
  const _AddOptionsButton({
    required this.optionController,
  });

  final TextEditingController optionController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: BlocBuilder<AddDiceCubit, CategoryDices>(
        builder: (context, state) {
          final cubit = context.read<AddDiceCubit>();
          return IconButton(
            onPressed: () async {
              if (optionController.text.isEmpty) return;
              await cubit.updateOptions([optionController.text]);
              optionController.clear();
            },
            icon: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

final class _AddOptionsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _AddOptionsAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      leading: const CustomBackButton(),
      title: Text(
        'Zar Seçenekleri',
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
