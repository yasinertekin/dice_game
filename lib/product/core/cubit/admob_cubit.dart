import 'package:dice_game/product/core/cubit/admob_state.dart';
import 'package:dice_game/product/core/mixin/admob_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AdmobCubit extends Cubit<AdmobState> with AdmobMixin {
  AdmobCubit() : super(const AdmobState());

  Future<void> loadAds() async {
    await loadRewardedAd();
  }

  Future<void> showAds() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await showRewardedAd();
    });
  }
}
