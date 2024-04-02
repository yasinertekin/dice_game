import 'package:dice_game/product/core/mixin/admob_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class RollDiceCounterCubit extends Cubit<int> with AdmobMixin {
  /// Constructor for the roll dice counter cubit.
  RollDiceCounterCubit() : super(0) {
    loadRewardedAd();
  }

  /// Increment the state.
  void increment() {
    emit(state + 1);
  }

  /// Show the ad.
  Future<void> showAd() async {
    increment();
    if (state % 3 == 0) {
      Future.delayed(
        const Duration(seconds: 1),
        () async {
          await loadRewardedAd();

          await showRewardedAd();
        },
      );
    }
  }
}
