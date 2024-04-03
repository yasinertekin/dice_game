part of '../settings_page.dart';

final class _CustomCupertinoActionSheet extends StatelessWidget {
  const _CustomCupertinoActionSheet({
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: Locales.values
          .map(
            (e) => CupertinoActionSheetAction(
              onPressed: () async {
                await ProductLocalization.updateLanguage(
                  context: context,
                  value: e,
                );
                // ignore: use_build_context_synchronously
                await cubit.getDiceModel(context);
                Locator.appRouter.popForced();
              },
              child: _CupertinoView(
                cubit: cubit,
                e: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
