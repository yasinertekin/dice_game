import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'options.g.dart';

@JsonSerializable()
@immutable
final class Options with EquatableMixin {
  Options({
    this.id,
    this.name,
  });

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
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
