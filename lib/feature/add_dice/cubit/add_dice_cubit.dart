import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:dice_game/product/core/model/options/options.dart';
import 'package:dice_game/product/core/model/sub_dices/sub_dices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A cubit to add dice
final class AddDiceCubit extends Cubit<CategoryDices> {
  /// Creates a new instance of the [AddDiceCubit] class
  AddDiceCubit()
      : super(
          CategoryDices(
            description: '',
            diceImage: '',
            diceName: '',
            icon: '',
            isAdultContent: false,
            isPremium: false,
            subDices: [
              SubDices(
                options: const [],
                name: '',
              ),
            ],
          ),
        );

  /// Sets the description of the dice
  Future<void> setDescription(String description) async {
    emit(state.copyWith(description: description));
  }

  /// Sets the dice image
  Future<void> setDiceImage(String diceImage) async {
    emit(state.copyWith(diceImage: diceImage));
  }

  /// Sets the dice name
  Future<void> setDiceName(String diceName) async {
    emit(state.copyWith(diceName: diceName));
  }

  /// Sets the icon of the dice,
  Future<void> setIcon(String icon) async {
    emit(state.copyWith(icon: icon));
  }

  /// Sets the adult content flag
  Future<void> updateOptions(List<String> newOptions) async {
    final updatedSubDices = List<SubDices>.from(state.subDices ?? []);

    // Iterate through existing subDices and update their options
    for (var i = 0; i < updatedSubDices.length; i++) {
      final currentOptions =
          List<Options>.from(updatedSubDices[i].options ?? []);

      // Add new options under the current subDice
      for (final option in newOptions) {
        currentOptions.add(Options(name: option));
      }

      // Update the subDice with the new options
      updatedSubDices[i] = updatedSubDices[i].copyWith(options: currentOptions);
    }

    // Emit the updated state with new options
    emit(state.copyWith(subDices: updatedSubDices));
  }

  /// Delete updated options
  Future<void> deleteOptionById(String optionId) async {
    final updatedSubDices = List<SubDices>.from(state.subDices ?? []);

    // Find the subDice and option with the given id
    for (var i = 0; i < updatedSubDices.length; i++) {
      final currentOptions =
          List<Options>.from(updatedSubDices[i].options ?? []);

      // Find the option with the given id
      final index =
          currentOptions.indexWhere((option) => option.id == optionId);
      if (index != -1) {
        // Remove the option with the specified id
        currentOptions.removeAt(index);
        // Update the subDice with the new options
        updatedSubDices[i] =
            updatedSubDices[i].copyWith(options: currentOptions);
        // Emit the updated state with new options
        emit(state.copyWith(subDices: updatedSubDices));
        return; // Found and deleted the option, exiting the function
      }
    }
  }
}
