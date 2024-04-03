part of '../settings_page.dart';

final class _MaterialModelView extends StatelessWidget {
  const _MaterialModelView({
    required this.cubit,
    required this.e,
  });

  final HomeCubit cubit;
  final Locales e;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: e.locale.languageCode,
        ),
        Checkbox(
          value: context.locale == e.locale,
          onChanged: (value) async {
            await ProductLocalization.updateLanguage(
              context: context,
              value: e,
            );
            await cubit.getDiceModel(context);
            Locator.appRouter.popForced();
          },
        ),
      ],
    );
  }
}
