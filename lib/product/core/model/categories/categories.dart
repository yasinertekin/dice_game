import 'package:dice_game/product/core/model/category_dices/category_dices.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
@immutable
final class Categories with EquatableMixin {
  Categories({
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
    this.categoryDices,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  @JsonKey(name: 'categoryName')
  final String? categoryName;
  @JsonKey(name: 'categoryIcon')
  final String? categoryIcon;
  @JsonKey(name: 'categoryColor')
  final String? categoryColor;
  @JsonKey(name: 'categoryDices')
  final List<CategoryDices>? categoryDices;

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

  @override
  List<Object?> get props =>
      [categoryName, categoryIcon, categoryColor, categoryDices];

  Categories copyWith({
    String? categoryName,
    String? categoryIcon,
    String? categoryColor,
    List<CategoryDices>? categoryDices,
  }) {
    return Categories(
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      categoryColor: categoryColor ?? this.categoryColor,
      categoryDices: categoryDices ?? this.categoryDices,
    );
  }
}
