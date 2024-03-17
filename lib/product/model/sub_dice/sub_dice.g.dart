// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_dice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubDice _$SubDiceFromJson(Map<String, dynamic> json) => SubDice(
      name: json['name'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubDiceToJson(SubDice instance) => <String, dynamic>{
      'name': instance.name,
      'options': instance.options,
    };
