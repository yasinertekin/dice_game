part of '../home_page.dart';

// ignore: must_be_immutable
final class _UserDiceCard extends StatefulWidget {
  const _UserDiceCard();

  @override
  State<_UserDiceCard> createState() => _UserDiceCardState();
}

final class _UserDiceCardState extends State<_UserDiceCard>
    with NavigationManager, AdmobMixin {
  Future<void> _loadRewardAds() async {
    await loadRewardedAd();
  }

  Future<void> _showAds() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await showRewardedAd();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      height: context.dynamicHeight(0.2),
      child: InkWell(
        onTap: () async {
          await _loadRewardAds();
          await _showAds();
          navigatePush(const UserDiceRoute());
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
      child: CustomText(
        text: LocaleKeys.home_usersDice,
        style: context.textTheme.titleLarge?.copyWith(
          color: ProjectColor.black.toColor,
          fontWeight: FontWeight.bold,
        ),
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
