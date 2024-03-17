import 'package:dice_game/product/model/dice_list/dice_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dice_categories.g.dart';

@JsonSerializable()
@immutable
final class DiceCategories with EquatableMixin {
  DiceCategories({
    this.categoryName,
    this.categoryColor,
    this.diceList,
  });

  factory DiceCategories.fromJson(Map<String, dynamic> json) =>
      _$DiceCategoriesFromJson(json);
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @JsonKey(name: 'category_color')
  final String? categoryColor;
  @JsonKey(name: 'dice_list')
  final List<DiceList>? diceList;

  Map<String, dynamic> toJson() => _$DiceCategoriesToJson(this);

  @override
  List<Object?> get props => [categoryName, categoryColor, diceList];

  DiceCategories copyWith({
    String? categoryName,
    String? categoryColor,
    List<DiceList>? diceList,
  }) {
    return DiceCategories(
      categoryName: categoryName ?? this.categoryName,
      categoryColor: categoryColor ?? this.categoryColor,
      diceList: diceList ?? this.diceList,
    );
  }
}
