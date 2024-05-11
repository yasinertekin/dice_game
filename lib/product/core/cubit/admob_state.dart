import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final class AdmobState extends Equatable {
  const AdmobState({
    this.interstitialAd,
    this.rewardedAd,
  });
  final InterstitialAd? interstitialAd;
  final RewardedAd? rewardedAd;

  @override
  List<Object?> get props => [interstitialAd, rewardedAd];

  AdmobState copyWith({
    InterstitialAd? interstitialAd,
    RewardedAd? rewardedAd,
  }) {
    return AdmobState(
      interstitialAd: interstitialAd ?? this.interstitialAd,
      rewardedAd: rewardedAd ?? this.rewardedAd,
    );
  }
}
