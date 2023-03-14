import 'dart:convert';

import 'package:hive/hive.dart';

part 'character_info_origin_model.g.dart';

Origin originFromJson(String str) => Origin.fromJson(json.decode(str));

String originToJson(Origin data) => json.encode(data.toJson());

@HiveType(typeId: 5)
class Origin extends HiveObject {
  Origin({
    String? dimension,
    String? name,
    String? type,
  }) {
    _dimension = dimension;
    _name = name;
    _type = type;
  }

  Origin.fromJson(dynamic json) {
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

  Origin copyWith({
    String? dimension,
    String? name,
    String? type,
  }) =>
      Origin(
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
