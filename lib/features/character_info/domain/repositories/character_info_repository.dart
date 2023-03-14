import 'package:dartz/dartz.dart';
import 'package:exercise_uic/features/character_info/domain/entites/character_info_entity.dart';

import '../../../../core/error/failures.dart';

abstract class CharacterInfoRepository {
  Future<Either<Failure, CharacterInfoEntity>> getAllCharacters(String characterId);
}
