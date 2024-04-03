part of '../settings_page.dart';

final class _CustomMaterialActionSheet extends StatelessWidget {
  const _CustomMaterialActionSheet({
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.25),
      child: Column(
        children: Locales.values
            .map(
              (e) => ListTile(
                title: _MaterialModelView(
                  cubit: cubit,
                  e: e,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
