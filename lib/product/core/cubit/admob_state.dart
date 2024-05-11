import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

enum AdLoadState { loading, loaded, failed, initial }

final class AdmobState extends Equatable {
  const AdmobState({
    this.interstitialAd,
    this.duration = 4,
    this.rewardedAd,
    this.adLoadState = AdLoadState.initial,
  });
  final InterstitialAd? interstitialAd;
  final RewardedAd? rewardedAd;
  final int duration;
  final AdLoadState adLoadState;

  @override
  List<Object?> get props =>
      [interstitialAd, rewardedAd, duration, adLoadState];

  AdmobState copyWith({
    InterstitialAd? interstitialAd,
    RewardedAd? rewardedAd,
    int? duration,
    AdLoadState? adLoadState,
  }) {
    return AdmobState(
      interstitialAd: interstitialAd ?? this.interstitialAd,
      rewardedAd: rewardedAd ?? this.rewardedAd,
      duration: duration ?? this.duration,
      adLoadState: adLoadState ?? this.adLoadState,
    );
  }
}
