part of '../catergory_detail_page.dart';

final class _CategoryDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CategoryDetailAppBar({
    required this.diceCategories,
  });

  final DiceCategories? diceCategories;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(diceCategories?.categoryName ?? ''),
      backgroundColor: ProjectColor.transparent.toColor,
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 10);
}
