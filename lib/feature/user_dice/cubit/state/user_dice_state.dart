import 'package:dice_game/product/model/category_dices/category_dices.dart';
import 'package:equatable/equatable.dart';

/// Represents the state of the user dice
final class UserDiceState extends Equatable {
  /// Creates a new instance of the [UserDiceState] class
  const UserDiceState({
    this.isLoading = true,
    this.error,
    this.categoryDices = const [],
  });

  /// The is loading
  final bool? isLoading;

  /// The error
  final String? error;

  /// The category dices
  final List<CategoryDices> categoryDices;

  /// A method to copy the current instance of the UserDiceState
  UserDiceState copyWith({
    bool? isPremium,
    bool? isLoading,
    String? error,
    List<CategoryDices>? categoryDices,
  }) {
    return UserDiceState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      categoryDices: categoryDices ?? this.categoryDices,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        categoryDices,
      ];
}
