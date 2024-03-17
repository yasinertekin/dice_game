import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_dice.g.dart';

@JsonSerializable()
@immutable
final class SubDice with EquatableMixin {
  SubDice({
    this.name,
    this.options,
  });

  factory SubDice.fromJson(Map<String, dynamic> json) =>
      _$SubDiceFromJson(json);
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'options')
  final List<String>? options;

  Map<String, dynamic> toJson() => _$SubDiceToJson(this);

  @override
  List<Object?> get props => [name, options];

  SubDice copyWith({
    String? name,
    List<String>? options,
  }) {
    return SubDice(
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }
}
