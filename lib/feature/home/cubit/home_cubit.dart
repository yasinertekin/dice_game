import 'package:dice_game/feature/home/cubit/state/home_state.dart';
import 'package:dice_game/product/core/service/json_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._jsonService, BuildContext context)
      : super(const HomeState(status: HomeStatus.loading)) {
    getDiceModel(context);
  }

  final IJsonService _jsonService;

  Future<void> getDiceModel(BuildContext context) async {
    try {
      final diceModel = await _jsonService.getDiceModel(context);
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          diceModel: diceModel,
        ),
      );
    } catch (e) {
      emit(const HomeState(status: HomeStatus.error));
      print(e);
    }
  }
}
