import 'package:dice_game/product/core/constants/hive_type_id_constants.dart';
import 'package:dice_game/product/core/model/sub_dices/sub_dices.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dices.g.dart';

@JsonSerializable()
@immutable
@HiveType(typeId: HiveTypeIdConstants.categoryDicesId)
final class CategoryDices with EquatableMixin {
  CategoryDices({
    this.diceName,
    this.icon,
    String? id,
    this.isPremium,
    this.isadultContent,
    this.description,
    this.subDices,
  }) : id = id ?? UniqueKey().toString();

  factory CategoryDices.fromJson(Map<String, dynamic> json) =>
      _$CategoryDicesFromJson(json);
  @HiveField(0)
  @JsonKey(name: 'dice_name')
  final String? diceName;
  @HiveField(1)
  @JsonKey(name: 'icon')
  final String? icon;
  @HiveField(2)
  @JsonKey(name: 'id')
  final String? id;
  @HiveField(3)
  @JsonKey(name: 'isPremium')
  final bool? isPremium;
  @HiveField(4)
  @JsonKey(name: 'isAdultContent')
  final bool? isadultContent;
  @HiveField(5)
  @JsonKey(name: 'description')
  final String? description;
  @HiveField(6)
  @JsonKey(name: 'sub_dices')
  final List<SubDices>? subDices;

  Map<String, dynamic> toJson() => _$CategoryDicesToJson(this);

  @override
  List<Object?> get props =>
      [diceName, icon, id, isPremium, isadultContent, description, subDices];

  ///
  CategoryDices copyWith({
    String? diceName,
    String? icon,
    String? id,
    bool? isPremium,
    bool? adultContent,
    String? description,
    List<SubDices>? subDices,
  }) {
    return CategoryDices(
      diceName: diceName ?? this.diceName,
      icon: icon ?? this.icon,
      id: id ?? this.id,
      isPremium: isPremium ?? this.isPremium,
      isadultContent: adultContent ?? isadultContent,
      description: description ?? this.description,
      subDices: subDices ?? this.subDices,
    );
  }
}
