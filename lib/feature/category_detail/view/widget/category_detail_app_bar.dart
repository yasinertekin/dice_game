part of '../catergory_detail_page.dart';

final class _CategoryDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CategoryDetailAppBar({
    required this.diceCategories,
  });

  final Categories? diceCategories;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          diceCategories?.categoryName ?? 'Zarların',
          style: context.textTheme.titleLarge!.copyWith(
            color: ProjectColor.white.toColor,
          ),
        ),
      ),
      backgroundColor: ProjectColor.transparent.toColor,
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 10);
}
