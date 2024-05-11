part of '../home_page.dart';

// ignore: must_be_immutable
final class _UserDiceCard extends StatefulWidget {
  const _UserDiceCard();

  @override
  State<_UserDiceCard> createState() => _UserDiceCardState();
}

final class _UserDiceCardState extends State<_UserDiceCard>
    with NavigationManager, AdmobMixin {
  @override
  Widget build(BuildContext context) {
    final selectAdmobState = context.select((AdmobCubit cubit) => cubit.state);
    return SizedBox(
      width: context.dynamicWidth(0.8),
      height: context.dynamicHeight(0.2),
      child: InkWell(
        onTap: () async {
          await context.read<AdmobCubit>().showAds();
          Future.delayed(
            const Duration(seconds: 3),
            () => navigatePush(const UserDiceRoute()),
          );
        },
        child: Card(
          shape: _CardShape(context),
          color: ProjectColor.buzzIn.toColor,
          child: const _CardTitle(),
        ),
      ),
    );
  }
}

final class _CardTitle extends StatelessWidget {
  const _CardTitle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<AdmobCubit, AdmobState>(
        builder: (context, state) {
          return state.adLoadState == AdLoadState.loading
              ? const CustomCircularProgressIndicator()
              : CustomText(
                  text: LocaleKeys.home_usersDice,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: ProjectColor.black.toColor,
                    fontWeight: FontWeight.bold,
                  ),
                );
        },
      ),
    );
  }
}

final class _CardShape extends RoundedRectangleBorder {
  _CardShape(BuildContext context)
      : super(
          borderRadius: context.borderRadiusLow,
          side: BorderSide(
            color: ProjectColor.white.toColor,
            width: 4,
          ),
        );
}
