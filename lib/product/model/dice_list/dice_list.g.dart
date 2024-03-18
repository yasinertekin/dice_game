// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dice _$DiceFromJson(Map<String, dynamic> json) => Dice(
      diceName: json['dice_name'] as String?,
      icon: json['icon'] as String?,
      isPremium: json['isPremium'] as bool?,
      subDice: (json['sub_dice'] as List<dynamic>?)
          ?.map((e) => SubDice.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DiceToJson(Dice instance) => <String, dynamic>{
      'dice_name': instance.diceName,
      'icon': instance.icon,
      'isPremium': instance.isPremium,
      'sub_dice': instance.subDice,
      'description': instance.description,
    };
