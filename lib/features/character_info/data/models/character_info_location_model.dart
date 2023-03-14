import 'dart:convert';

import 'package:hive/hive.dart';

part 'character_info_location_model.g.dart';

InfoLocation locationFromJson(String str) => InfoLocation.fromJson(json.decode(str));

String locationToJson(InfoLocation data) => json.encode(data.toJson());

@HiveType(typeId: 4)
class InfoLocation extends HiveObject {
  InfoLocation({
    String? dimension,
    String? name,
    String? type,
  }) {
    _dimension = dimension;
    _name = name;
    _type = type;
  }

  InfoLocation.fromJson(dynamic json) {
    _dimension = json['dimension'];
    _name = json['name'];
    _type = json['type'];
  }

  @HiveField(0)
  String? _dimension;
  @HiveField(1)
  String? _name;
  @HiveField(2)
  String? _type;

  InfoLocation copyWith({
    String? dimension,
    String? name,
    String? type,
  }) =>
      InfoLocation(
        dimension: dimension ?? _dimension,
        name: name ?? _name,
        type: type ?? _type,
      );

  String? get dimension => _dimension;

  String? get name => _name;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dimension'] = _dimension;
    map['name'] = _name;
    map['type'] = _type;
    return map;
  }
}
