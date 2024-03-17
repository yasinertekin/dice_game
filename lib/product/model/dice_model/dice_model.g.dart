// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiceModel _$DiceModelFromJson(Map<String, dynamic> json) => DiceModel(
      diceCategories: (json['dice_categories'] as List<dynamic>?)
          ?.map((e) => DiceCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiceModelToJson(DiceModel instance) => <String, dynamic>{
      'dice_categories': instance.diceCategories,
    };
