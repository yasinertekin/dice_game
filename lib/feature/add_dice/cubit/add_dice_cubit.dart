import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A cubit to add dice
final class AddDiceCubit extends Cubit<CategoryDices> {
  /// Creates a new instance of the [AddDiceCubit] class
  AddDiceCubit() : super(CategoryDices());

  /// A method to add dice
  void addDice(CategoryDices categoryDices) {
    emit(categoryDices);
  }
}
