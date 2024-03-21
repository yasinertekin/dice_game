import 'package:dice_game/feature/favorite/cubit/state/favorite_state.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/utils/cache/cache_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// FavoriteCubit
final class FavoriteCubit extends Cubit<FavoriteState> {
  /// FavoriteCubit
  FavoriteCubit(
    this._userDiceRepository,
  ) : super(const FavoriteState());

  final FavoriteCacheManager _userDiceRepository;

  /// Fetch favorite
  Future<void> fetchFavorite() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _userDiceRepository.init();
      final categoryDices = _userDiceRepository.getValues();
      emit(state.copyWith(isLoading: false, categoryDices: categoryDices));
    } on Exception catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// Add favorite
  Future<void> addFavorite(CategoryDices categoryDices) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _userDiceRepository.putItem(
        categoryDices.id.toString(),
        categoryDices,
      );
      final retrievedCategoryDices = _userDiceRepository.getValues();
      emit(
        state.copyWith(
          isLoading: false,
          categoryDices: retrievedCategoryDices,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// Remove favorite
  Future<void> removeFavorite(CategoryDices categoryDices) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _userDiceRepository.removeItem(categoryDices.id.toString());
      final retrievedCategoryDices = _userDiceRepository.getValues();
      emit(
        state.copyWith(
          isLoading: false,
          categoryDices: retrievedCategoryDices,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
