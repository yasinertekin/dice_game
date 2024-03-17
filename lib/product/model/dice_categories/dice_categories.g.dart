// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiceCategories _$DiceCategoriesFromJson(Map<String, dynamic> json) =>
    DiceCategories(
      categoryName: json['category_name'] as String?,
      categoryColor: json['category_color'] as String?,
      diceList: (json['dice_list'] as List<dynamic>?)
          ?.map((e) => DiceList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiceCategoriesToJson(DiceCategories instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      'category_color': instance.categoryColor,
      'dice_list': instance.diceList,
    };
