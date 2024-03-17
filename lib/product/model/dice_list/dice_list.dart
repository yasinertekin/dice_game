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
  });

  factory DiceList.fromJson(Map<String, dynamic> json) =>
      _$DiceListFromJson(json);
  @JsonKey(name: 'dice_name')
  final String? diceName;
  @JsonKey(name: 'icon')
  final String? icon;

  Map<String, dynamic> toJson() => _$DiceListToJson(this);

  @override
  List<Object?> get props => [diceName, icon];

  DiceList copyWith({
    String? diceName,
    String? icon,
  }) {
    return DiceList(
      diceName: diceName ?? this.diceName,
      icon: icon ?? this.icon,
    );
  }
}
