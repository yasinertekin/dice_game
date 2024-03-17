import 'package:dice_game/product/model/sub_dice/sub_dice.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dice_list.g.dart';

@JsonSerializable()
@immutable
final class DiceList with EquatableMixin {
  DiceList({
    this.diceName,
    this.icon,
    this.isPremium,
    this.subDice,
  });

  factory DiceList.fromJson(Map<String, dynamic> json) =>
      _$DiceListFromJson(json);
  @JsonKey(name: 'dice_name')
  final String? diceName;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'isPremium')
  final bool? isPremium;
  @JsonKey(name: 'sub_dice')
  final List<SubDice>? subDice;

  Map<String, dynamic> toJson() => _$DiceListToJson(this);

  @override
  List<Object?> get props => [diceName, icon, isPremium, subDice];

  DiceList copyWith({
    String? diceName,
    String? icon,
    bool? isPremium,
    List<SubDice>? subDice,
  }) {
    return DiceList(
      diceName: diceName ?? this.diceName,
      icon: icon ?? this.icon,
      isPremium: isPremium ?? this.isPremium,
      subDice: subDice ?? this.subDice,
    );
  }
}
