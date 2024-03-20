// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionsAdapter extends TypeAdapter<Options> {
  @override
  final int typeId = 2;

  @override
  Options read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Options(
      id: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Options obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
