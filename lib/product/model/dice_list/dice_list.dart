import 'package:dice_game/product/model/sub_dice/sub_dice.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dice_list.g.dart';

@JsonSerializable()
@immutable
final class Dice with EquatableMixin {
  Dice({
    this.diceName,
    this.icon,
    this.isPremium,
    this.subDice,
    this.description,
  });

  factory Dice.fromJson(Map<String, dynamic> json) => _$DiceFromJson(json);
  @JsonKey(name: 'dice_name')
  final String? diceName;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'isPremium')
  final bool? isPremium;
  @JsonKey(name: 'sub_dice')
  final List<SubDice>? subDice;
  @JsonKey(name: 'description')
  final String? description;

  Map<String, dynamic> toJson() => _$DiceToJson(this);

  @override
  List<Object?> get props => [diceName, icon, isPremium, subDice];

  Dice copyWith({
    String? diceName,
    String? icon,
    bool? isPremium,
    List<SubDice>? subDice,
    String? description,
  }) {
    return Dice(
      diceName: diceName ?? this.diceName,
      icon: icon ?? this.icon,
      isPremium: isPremium ?? this.isPremium,
      subDice: subDice ?? this.subDice,
      description: description ?? this.description,
    );
  }
}
