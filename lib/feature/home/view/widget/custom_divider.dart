part of '../home_page.dart';

final class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Divider(
        height: 0,
        thickness: 3,
        color: ProjectColor.black.color,
      ),
    );
  }
}
