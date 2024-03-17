import 'package:dice_game/product/model/dice_categories/dice_categories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dice_model.g.dart';

@JsonSerializable()
@immutable
class DiceModel with EquatableMixin {
  DiceModel({
    this.diceCategories,
  });

  factory DiceModel.fromJson(Map<String, dynamic> json) =>
      _$DiceModelFromJson(json);
  @JsonKey(name: 'dice_categories')
  final List<DiceCategories>? diceCategories;

  Map<String, dynamic> toJson() => _$DiceModelToJson(this);

  @override
  List<Object?> get props => [diceCategories];

  DiceModel copyWith({
    List<DiceCategories>? diceCategories,
  }) {
    return DiceModel(
      diceCategories: diceCategories ?? this.diceCategories,
    );
  }
}
