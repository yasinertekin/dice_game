import 'package:dice_game/product/core/constants/hive_type_id_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'options.g.dart';

@JsonSerializable()
@immutable
@HiveType(typeId: HiveTypeIdConstants.optionsId)
final class Options with EquatableMixin {
  Options({
    String? id,
    this.name,
  }) : id = id ?? UniqueKey().toString();

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
  @HiveField(0)
  @JsonKey(name: 'id')
  final String? id;
  @HiveField(1)
  @JsonKey(name: 'name')
  final String? name;

  Map<String, dynamic> toJson() => _$OptionsToJson(this);

  @override
  List<Object?> get props => [id, name];

  Options copyWith({
    String? id,
    String? name,
  }) {
    return Options(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
