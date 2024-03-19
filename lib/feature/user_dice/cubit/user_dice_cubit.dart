import 'package:dice_game/feature/user_dice/cubit/state/user_dice_state.dart';
import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/utils/cache/cache_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A cubit that manages the user dice state
final class UserDiceCubit extends Cubit<UserDiceState> {
  /// Creates a new instance of the [UserDiceCubit] class.
  UserDiceCubit(this._userDiceRepository) : super(const UserDiceState());

  final CategoryDicesCacheManager _userDiceRepository;

  /// Fetches the user dice
  Future<void> fetchUserDice() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _userDiceRepository.init();
      final categoryDices = _userDiceRepository.getValues();
      emit(state.copyWith(isLoading: false, categoryDices: categoryDices));
    } on Exception catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Add user dice
  Future<void> addUserDice(CategoryDices categoryDices) async {
    emit(state.copyWith(isLoading: true));
    try {
      // Put the categoryDices into the repository
      await _userDiceRepository.addItems([categoryDices]);

      // Retrieve the categoryDices from the repository
      final retrievedCategoryDices = _userDiceRepository.getValues();

      // Update the state with the retrieved categoryDices
      emit(
        state.copyWith(
          isLoading: false,
          categoryDices: retrievedCategoryDices,
        ),
      );
    } catch (e) {
      // If an exception occurs, update the state with the error message
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
