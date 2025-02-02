part of '../add_dice_page.dart';

final class _AddIcon extends StatelessWidget {
  const _AddIcon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.silkyWhite.toColor,
      appBar: const _AddIconAppBar(),
      body: BlocBuilder<SVGFilesCubit, List<String>>(
        builder: (context, state) {
          return state.isEmpty
              ? const CustomText(
                  text: LocaleKeys.add_dice_icon_not_found,
                )
              : _IconList(
                  iconList: state,
                );
        },
      ),
    );
  }
}

final class _AddIconAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _AddIconAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColor.concreteSideWalk.toColor,
      leading: const CustomBackButton(),
      actions: const [
        _SaveIconButton(),
      ],
      title: CustomText(
        text: LocaleKeys.add_dice_select_icon,
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.white.toColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _IconList extends StatelessWidget {
  const _IconList({
    required this.iconList,
  });
  final List<String> iconList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: iconList.length,
      itemBuilder: (context, index) {
        return _IconCard(
          index,
          iconList[index],
        );
      },
    );
  }
}

final class _IconCard extends StatelessWidget {
  const _IconCard(
    this.index,
    this.path,
  );
  final int index;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SVGFilesCubit>().selectIcon(index);
      },
      child: Card(
        color: context.read<SVGFilesCubit>().selectedIconIndex == index
            ? ProjectColor.buzzIn.toColor
            : ProjectColor.transparent.toColor,
        child: CustomSvg(
          assetPath: path,
          color: ProjectColor.black.toColor,
        ),
      ),
    );
  }
}

final class _SaveIconButton extends StatelessWidget with NavigationManager {
  const _SaveIconButton();
//context.read<SVGFilesCubit>().selectedIconIndex == -1
  @override
  Widget build(BuildContext context) {
    final userDice = context.read<AddDiceCubit>().state;
    return IconButton(
      onPressed: () async {
        if (context.read<SVGFilesCubit>().selectedIconIndex == -1) {
          context.showCustomSnackBar(
            message: LocaleKeys.add_dice_select_icon.tr(),
          );
          return;
        }
        await _setIcon(context);

        await _addDice(
          // ignore: use_build_context_synchronously
          context,
          userDice,
        );
        await Locator.appRouter.popAndPush(
          const UserDiceRoute(),
        );
      },
      icon: const Icon(Icons.check),
    );
  }

  Future<void> _addDice(BuildContext context, CategoryDices userDice) async {
    await context.read<UserDiceCubit>().addUserDice(
          CategoryDices(
            description: userDice.description,
            diceName: userDice.diceName,
            icon: context.read<SVGFilesCubit>().selectedIcon,
            isAdultContent: false,
            isPremium: false,
            subDices: context.read<AddDiceCubit>().state.subDices,
          ),
        );
  }

  Future<void> _setIcon(BuildContext context) async {
    await context.read<AddDiceCubit>().setIcon(
          context.read<SVGFilesCubit>().selectedIcon,
        );
  }
}
