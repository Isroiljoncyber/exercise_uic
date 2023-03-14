import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_uic/features/character_info/domain/entites/character_info_entity.dart';
import 'package:exercise_uic/features/character_info/domain/repositories/character_info_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class UsesCaseCharacterInfo extends UseCase<CharacterInfoEntity, CharactersParams> {
  UsesCaseCharacterInfo(this.characterInfoRepository);

  CharacterInfoRepository characterInfoRepository;

  @override
  Future<Either<Failure, CharacterInfoEntity>> call(params) {
    return characterInfoRepository.getAllCharacters(params.characterId);
  }
}

class CharactersParams extends Equatable {
  const CharactersParams(this.characterId);

  final String characterId;

  @override
  List<Object?> get props => [characterId];
}
