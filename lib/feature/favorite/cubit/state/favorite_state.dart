import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class FavoriteState extends Equatable {
  const FavoriteState({
    this.isLoading = true,
    this.errorMessage = '',
    this.categoryDices = const [],
  });
  final bool isLoading;

  final String errorMessage;

  final List<CategoryDices> categoryDices;

  @override
  List<Object?> get props => [isLoading, errorMessage, categoryDices];

  FavoriteState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CategoryDices>? categoryDices,
  }) {
    return FavoriteState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      categoryDices: categoryDices ?? this.categoryDices,
    );
  }
}
