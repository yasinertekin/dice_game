import 'package:dice_game/product/core/mixin/admob_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit for the dice description page.
final class DiceDescriptionCubit extends Cubit<int> with AdmobMixin {
  /// Constructor for the dice description cubit.
  DiceDescriptionCubit() : super(0) {
    loadRewardedAd();
  }

  /// Increment the state.
  void _increment() {
    emit(state + 1);
  }

  /// Show the ad.
  Future<void> showAd() async {
    _increment();
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
