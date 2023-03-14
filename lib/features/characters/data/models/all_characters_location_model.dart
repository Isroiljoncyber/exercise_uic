import 'dart:convert';

import 'package:hive/hive.dart';

part 'all_characters_location_model.g.dart';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

@HiveType(typeId: 3)
class Location extends HiveObject {
  Location({
    String? name,
    String? type,
  }) {
    _name = name;
    _type = type;
  }

  Location.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
  }

  @HiveField(0)
  String? _name;
  @HiveField(2)
  String? _type;

  Location copyWith({
    String? name,
    String? type,
  }) =>
      Location(
        name: name ?? _name,
        type: type ?? _type,
      );

  String? get name => _name;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    return map;
  }
}
