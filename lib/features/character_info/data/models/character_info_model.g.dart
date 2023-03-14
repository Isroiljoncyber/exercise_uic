// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterInfoModelAdapter extends TypeAdapter<CharacterInfoModel> {
  @override
  final int typeId = 2;

  @override
  CharacterInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterInfoModel()
      .._gender = fields[0] as String?
      .._id = fields[1] as String?
      .._image = fields[2] as String?
      .._location = fields[3] as InfoLocation?
      .._name = fields[4] as String?
      .._origin = fields[5] as Origin?
      .._species = fields[6] as String?
      .._status = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, CharacterInfoModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj._gender)
      ..writeByte(1)
      ..write(obj._id)
      ..writeByte(2)
      ..write(obj._image)
      ..writeByte(3)
      ..write(obj._location)
      ..writeByte(4)
      ..write(obj._name)
      ..writeByte(5)
      ..write(obj._origin)
      ..writeByte(6)
      ..write(obj._species)
      ..writeByte(7)
      ..write(obj._status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
