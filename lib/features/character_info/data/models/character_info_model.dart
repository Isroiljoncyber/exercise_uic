import 'dart:convert';

import 'package:exercise_uic/features/character_info/data/models/character_info_location_model.dart';
import 'package:exercise_uic/features/character_info/data/models/character_info_origin_model.dart';
import 'package:hive/hive.dart';

/// gender : "Male"
/// id : "1"
/// image : "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
/// location : {"dimension":"unknown","name":"Citadel of Ricks","type":"Space station"}
/// name : "Rick Sanchez"
/// origin : {"dimension":"Dimension C-137","name":"Earth (C-137)","type":"Planet"}
/// species : "Human"
/// status : "Alive"

part 'character_info_model.g.dart';

CharacterInfoModel characterInfoModelFromJson(String str) => CharacterInfoModel.fromJson(json.decode(str));

String characterInfoModelToJson(CharacterInfoModel data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class CharacterInfoModel extends HiveObject {
  CharacterInfoModel({
    String? gender,
    String? id,
    String? image,
    InfoLocation? location,
    String? name,
    Origin? origin,
    String? species,
    String? status,
  }) {
    _gender = gender;
    _id = id;
    _image = image;
    _location = location;
    _name = name;
    _origin = origin;
    _species = species;
    _status = status;
  }

  CharacterInfoModel.fromJson(dynamic json) {
    _gender = json['gender'];
    _id = json['id'];
    _image = json['image'];
    _location = json['location'] != null ? InfoLocation.fromJson(json['location']) : null;
    _name = json['name'];
    _origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    _species = json['species'];
    _status = json['status'];
  }

  @HiveField(0)
  String? _gender;
  @HiveField(1)
  String? _id;
  @HiveField(2)
  String? _image;
  @HiveField(3)
  InfoLocation? _location;
  @HiveField(4)
  String? _name;
  @HiveField(5)
  Origin? _origin;
  @HiveField(6)
  String? _species;
  @HiveField(7)
  String? _status;

  CharacterInfoModel copyWith({
    String? gender,
    String? id,
    String? image,
    InfoLocation? location,
    String? name,
    Origin? origin,
    String? species,
    String? status,
  }) =>
      CharacterInfoModel(
        gender: gender ?? _gender,
        id: id ?? _id,
        image: image ?? _image,
        location: location ?? _location,
        name: name ?? _name,
        origin: origin ?? _origin,
        species: species ?? _species,
        status: status ?? _status,
      );

  String? get gender => _gender;

  String? get id => _id;

  String? get image => _image;

  InfoLocation? get location => _location;

  String? get name => _name;

  Origin? get origin => _origin;

  String? get species => _species;

  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = _gender;
    map['id'] = _id;
    map['image'] = _image;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['name'] = _name;
    if (_origin != null) {
      map['origin'] = _origin?.toJson();
    }
    map['species'] = _species;
    map['status'] = _status;
    return map;
  }
}

/// dimension : "Dimension C-137"
/// name : "Earth (C-137)"
/// type : "Planet"

/// dimension : "unknown"
/// name : "Citadel of Ricks"
/// type : "Space station"
