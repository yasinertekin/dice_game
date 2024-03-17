// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiceList _$DiceListFromJson(Map<String, dynamic> json) => DiceList(
      diceName: json['dice_name'] as String?,
      icon: json['icon'] as String?,
      isPremium: json['isPremium'] as bool?,
      subDice: (json['sub_dice'] as List<dynamic>?)
          ?.map((e) => SubDice.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DiceListToJson(DiceList instance) => <String, dynamic>{
      'dice_name': instance.diceName,
      'icon': instance.icon,
      'isPremium': instance.isPremium,
      'sub_dice': instance.subDice,
      'description': instance.description,
    };
