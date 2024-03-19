import 'package:dice_game/feature/home/cubit/state/home_state.dart';
import 'package:dice_game/product/core/service/json_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._jsonService)
      : super(const HomeState(status: HomeStatus.loading)) {
    _getDiceModel();
  }

  final IJsonService _jsonService;

  Future<void> _getDiceModel() async {
    try {
      final diceModel = await _jsonService.getDiceModel();
      emit(HomeState(diceModel: diceModel, status: HomeStatus.loaded));
    } catch (e) {
      emit(const HomeState(status: HomeStatus.error));
    }
  }
}
