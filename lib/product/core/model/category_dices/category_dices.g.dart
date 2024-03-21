// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dices.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryDicesAdapter extends TypeAdapter<CategoryDices> {
  @override
  final int typeId = 0;

  @override
  CategoryDices read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryDices(
      diceName: fields[0] as String?,
      icon: fields[1] as String?,
      id: fields[2] as String?,
      diceImage: fields[3] as String?,
      isPremium: fields[4] as bool?,
      isAdultContent: fields[5] as bool?,
      description: fields[6] as String?,
      subDices: (fields[7] as List?)?.cast<SubDices>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryDices obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.diceName)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.diceImage)
      ..writeByte(4)
      ..write(obj.isPremium)
      ..writeByte(5)
      ..write(obj.isAdultContent)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.subDices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDicesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDices _$CategoryDicesFromJson(Map<String, dynamic> json) =>
    CategoryDices(
      diceName: json['dice_name'] as String?,
      icon: json['icon'] as String?,
      id: json['id'] as String?,
      diceImage: json['dice_image'] as String?,
      isPremium: json['isPremium'] as bool?,
      isAdultContent: json['isAdultContent'] as bool?,
      description: json['description'] as String?,
      subDices: (json['sub_dices'] as List<dynamic>?)
          ?.map((e) => SubDices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDicesToJson(CategoryDices instance) =>
    <String, dynamic>{
      'dice_name': instance.diceName,
      'icon': instance.icon,
      'id': instance.id,
      'dice_image': instance.diceImage,
      'isPremium': instance.isPremium,
      'isAdultContent': instance.isAdultContent,
      'description': instance.description,
      'sub_dices': instance.subDices,
    };
