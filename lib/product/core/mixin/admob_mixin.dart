import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

base mixin AdmobMixin {
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  // final String _adUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-3940256099942544/1033173712'
  //     : 'ca-app-pub-3940256099942544/4411468910 ';

  final String _addRewardId = Platform.isAndroid
      ? 'ca-app-pub-5735107573485959/7660460954'
      : 'ca-app-pub-5735107573485959/4292061586';

  // Future<void> loadAds() async {
  //   await InterstitialAd.load(
  //     adUnitId: _adUnitId,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       // Called when an ad is successfully received.
  //       onAdLoaded: (InterstitialAd ad) {
  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //           // Called when the ad showed the full screen content.
  //           onAdShowedFullScreenContent: (ad) {},
  //           // Called when an impression occurs on the ad.
  //           onAdImpression: (ad) {},
  //           // Called when the ad failed to show full screen content.
  //           onAdFailedToShowFullScreenContent: (ad, err) {
  //             ad.dispose();
  //           },
  //           // Called when the ad dismissed full screen content.
  //           onAdDismissedFullScreenContent: (ad) {
  //             ad.dispose();
  //           },
  //           // Called when a click is recorded for an ad.
  //           onAdClicked: (ad) {},
  //         );

  //         // Keep a reference to the ad so you can show it later.
  //         _interstitialAd = ad;
  //       },
  //       // Called when an ad request failed.
  //       onAdFailedToLoad: (LoadAdError error) {
  //         // ignore: avoid_print
  //         print('InterstitialAd failed to load: $error');
  //       },
  //     ),
  //   );
  // }

  Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: _addRewardId,
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
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          // ignore: avoid_print
          print('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  Future<void> showInterstitialAd() async {
    await _interstitialAd?.show();
  }

  Future<void> showRewardedAd() async {
    await _rewardedAd?.show(
      onUserEarnedReward: (ad, reward) {
        // ignore: avoid_print
      },
    );
  }
}
