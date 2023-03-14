import 'dart:convert';

import 'package:exercise_uic/features/characters/data/models/all_characters_location_model.dart';
import 'package:hive/hive.dart';

/// id : "1"
/// image : "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
/// name : "Rick Sanchez"
/// status : "Alive"
/// location : {"name":"Citadel of Ricks","type":"Space station"}

part "all_characters_model.g.dart";

AllCharactersModel allCharactersModelFromJson(String str) => AllCharactersModel.fromJson(json.decode(str));

String allCharactersModelToJson(AllCharactersModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class AllCharactersModel extends HiveObject {
  AllCharactersModel({
    String? id,
    String? image,
    String? name,
    String? status,
    Location? location,
  }) {
    _id = id;
    _image = image;
    _name = name;
    _status = status;
    _location = location;
  }

  AllCharactersModel.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _status = json['status'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  @HiveField(0)
  String? _id;

  @HiveField(2)
  String? _image;

  @HiveField(3)
  String? _name;

  @HiveField(4)
  String? _status;

  @HiveField(5)
  Location? _location;

  AllCharactersModel copyWith({
    String? id,
    String? image,
    String? name,
    String? status,
    Location? location,
  }) =>
      AllCharactersModel(
        id: id ?? _id,
        image: image ?? _image,
        name: name ?? _name,
        status: status ?? _status,
        location: location ?? _location,
      );

  String? get id => _id;

  String? get image => _image;

  String? get name => _name;

  String? get status => _status;

  Location? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['status'] = _status;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    return map;
  }
}

/// name : "Citadel of Ricks"
/// type : "Space station"
