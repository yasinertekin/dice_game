part of '../home_page.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton.filled(
        icon: const Icon(Icons.menu),
        onPressed: () async {
          final adUnitId = Platform.isAndroid
              ? 'ca-app-pub-3940256099942544/1033173712'
              : 'ca-app-pub-3940256099942544/4411468910';
          RewardedAd? rewardedAd;

          await RewardedAd.load(
            adUnitId: adUnitId,
            request: const AdRequest(),
            rewardedAdLoadCallback: RewardedAdLoadCallback(
              onAdLoaded: (ad) {
                ad.fullScreenContentCallback = FullScreenContentCallback(
                  // Called when the ad showed the full screen content.
                  onAdShowedFullScreenContent: (ad) {},
                  // Called when an impression occurs on the ad.
                  onAdImpression: (ad) {},
                  // Called when the ad failed to show full screen content.
                  onAdFailedToShowFullScreenContent: (ad, err) {
                    ad.dispose();
                  },
                  // Called when the ad dismissed full screen content.
                  onAdDismissedFullScreenContent: (ad) {
                    ad.dispose();
                  },
                  // Called when a click is recorded for an ad.
                  onAdClicked: (ad) {},
                );

                // Keep a reference to the ad so you can show it later.
                rewardedAd = ad;
              },
              onAdFailedToLoad: (LoadAdError error) {
                // ignore: avoid_print
                print('RewardedAd failed to load: $error');
              },
            ),
          );
        },
      ),
      backgroundColor: ProjectColor.silkyWhite.toColor,
      title: const _AppLogo(),
      automaticallyImplyLeading: false,
      bottom: const _AppbarBottom(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ProjectAssets.imgAppLogo.toPng,
      height: context.dynamicHeight(0.05),
      fit: BoxFit.fill,
    );
  }
}

final class _AppbarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppbarBottom();

  @override
  Widget build(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: _CustomDivider(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
