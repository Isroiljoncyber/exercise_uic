import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_uic/core/error/failures.dart';
import 'package:exercise_uic/core/usecase/usecase.dart';
import 'package:exercise_uic/features/characters/domain/entities/all_characters_entity.dart';
import 'package:exercise_uic/features/characters/domain/repositories/all_characters_repsitory.dart';

class UsesCaseAllCharacters extends UseCase<List<AllCharactersEntity>, CharactersParams> {
  UsesCaseAllCharacters(this.allCharactersRepository);

  AllCharactersRepository allCharactersRepository;

  @override
  Future<Either<Failure, List<AllCharactersEntity>>> call(params) {
    return allCharactersRepository.getAllCharacters();
  }
}

class CharactersParams extends Equatable {
  @override
  List<Object?> get props => [];
}
