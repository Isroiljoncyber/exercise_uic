import 'package:equatable/equatable.dart';
import 'package:exercise_uic/features/characters/domain/entities/location_entity.dart';

// ignore: must_be_immutable
class AllCharactersEntity extends Equatable {
  AllCharactersEntity({this.id, this.image, this.name, this.status, this.location});

  String? id;
  String? image;
  String? name;
  String? status;
  Location? location;

  @override
  List<Object?> get props => [id!, image!, name!, status!, location!];
}
