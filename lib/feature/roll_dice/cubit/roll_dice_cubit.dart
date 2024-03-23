import 'dart:math';

import 'package:dice_game/product/core/model/options/options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum RollDiceState { initial, completed }

final class RollDiceCubit extends Cubit<RollDiceState> {
  RollDiceCubit() : super(RollDiceState.initial);

  final _random = Random();

  int getRandomIndex(List<Options>? options) {
    return _random.nextInt(options?.length ?? 0);
  }

  void completeAnimation() => emit(RollDiceState.completed);

  void resetAnimation() => emit(RollDiceState.initial);
}
