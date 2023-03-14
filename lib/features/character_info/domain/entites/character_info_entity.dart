import 'package:equatable/equatable.dart';

import 'location_entity.dart';
import 'origin_entity.dart';

class CharacterInfoEntity extends Equatable {
  final String? gender;
  final String? id;
  final String? image;
  final LocationCharacterInfo? location;
  final String? name;
  final Origin? origin;
  final String? species;
  final String? status;

  const CharacterInfoEntity(
      {required this.gender,
      required this.id,
      required this.image,
      required this.location,
      required this.name,
      required this.origin,
      required this.species,
      required this.status});

  @override
  List<Object?> get props => [gender, id, image, location, name, origin, species, status];
}
