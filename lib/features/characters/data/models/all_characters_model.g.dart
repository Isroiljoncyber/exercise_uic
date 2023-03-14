// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_characters_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllCharactersModelAdapter extends TypeAdapter<AllCharactersModel> {
  @override
  final int typeId = 1;

  @override
  AllCharactersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllCharactersModel()
      .._id = fields[0] as String?
      .._image = fields[2] as String?
      .._name = fields[3] as String?
      .._status = fields[4] as String?
      .._location = fields[5] as Location?;
  }

  @override
  void write(BinaryWriter writer, AllCharactersModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(2)
      ..write(obj._image)
      ..writeByte(3)
      ..write(obj._name)
      ..writeByte(4)
      ..write(obj._status)
      ..writeByte(5)
      ..write(obj._location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllCharactersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
