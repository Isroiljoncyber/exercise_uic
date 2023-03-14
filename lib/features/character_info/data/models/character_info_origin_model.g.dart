// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_info_origin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OriginAdapter extends TypeAdapter<Origin> {
  @override
  final int typeId = 5;

  @override
  Origin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Origin()
      .._dimension = fields[0] as String?
      .._name = fields[1] as String?
      .._type = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, Origin obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._dimension)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OriginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
