import 'package:dartz/dartz.dart';
import 'package:exercise_uic/core/error/failures.dart';
import 'package:exercise_uic/features/characters/domain/entities/all_characters_entity.dart';

abstract class AllCharactersRepository {
  Future<Either<Failure, List<AllCharactersEntity>>> getAllCharacters();
}
