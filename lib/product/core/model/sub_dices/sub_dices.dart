import 'package:dice_game/product/core/constants/hive_type_id_constants.dart';
import 'package:dice_game/product/core/model/options/options.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_dices.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeIdConstants.subDicesId)
@immutable
final class SubDices with EquatableMixin {
  SubDices({
    this.name,
    this.options,
  });

  factory SubDices.fromJson(Map<String, dynamic> json) =>
      _$SubDicesFromJson(json);
  @HiveField(0)
  @JsonKey(name: 'name')
  final String? name;
  @HiveField(1)
  @JsonKey(name: 'options')
  final List<Options>? options;

  Map<String, dynamic> toJson() => _$SubDicesToJson(this);

  @override
  List<Object?> get props => [name, options];

  SubDices copyWith({
    String? name,
    List<Options>? options,
  }) {
    return SubDices(
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }
}
