import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'dice_state.dart';

/// DiceTypeCubit is used to change the selected dice type of the app

final class DiceTypeCubit extends HydratedCubit<DiceState> {
  /// DiceTypeCubit constructor
  DiceTypeCubit() : super(const DiceState());

  /// Takes a [DiceType] object and changes the selected dice type
  Future<void> changeDiceType(DiceType diceType) async {
    emit(DiceState(selectedDice: diceType));
  }

  @override
  DiceState? fromJson(Map<String, dynamic> json) {
    return DiceState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DiceState state) {
    return state.toMap();
  }
}
