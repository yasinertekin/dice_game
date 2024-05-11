import 'package:dice_game/product/core/cubit/admob_state.dart';
import 'package:dice_game/product/core/mixin/admob_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AdmobCubit extends Cubit<AdmobState> with AdmobMixin {
  AdmobCubit() : super(const AdmobState());

  Future<void> loadAds() async {}

  Future<void> showAds() async {
    emit(state.copyWith(adLoadState: AdLoadState.loading));
    await loadRewardedAd();

    Future.delayed(Duration(seconds: state.duration), () async {
      await showRewardedAd();
      emit(state.copyWith(adLoadState: AdLoadState.loaded));
    });
  }

  void resetState() {
    emit(state.copyWith(adLoadState: AdLoadState.initial));
  }
}
