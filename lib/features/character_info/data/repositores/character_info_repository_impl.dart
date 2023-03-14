import 'package:dartz/dartz.dart';
import 'package:exercise_uic/core/error/failures.dart';
import 'package:exercise_uic/core/network/network_checker.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entites/character_info_entity.dart';
import '../../domain/entites/location_entity.dart';
import '../../domain/entites/origin_entity.dart';
import '../../domain/repositories/character_info_repository.dart';
import '../datasources/character_info_local.dart';
import '../datasources/character_info_remote.dart';

class CharacterInfoRepositoryImpl extends CharacterInfoRepository {
  CharacterInfoRepositoryImpl({
    required this.characterInfoLocal,
    required this.characterInfoRemote,
    required this.networkChecker,
  });

  final CharacterInfoLocal characterInfoLocal;
  final CharacterInfoRemote characterInfoRemote;
  final NetworkChecker networkChecker;

  @override
  Future<Either<Failure, CharacterInfoEntity>> getAllCharacters(characterId) async {
    if (await networkChecker.isNetWorkAvailable) {
      try {
        final result = await characterInfoRemote.getCharacterInfo(characterId);
        final entity = CharacterInfoEntity(
          gender: result.gender,
          id: result.id,
          image: result.image,
          location: LocationCharacterInfo(
              type: result.location!.type, name: result.location!.name, dimension: result.location!.dimension),
          name: result.name,
          origin: Origin(
            dimension: result.origin!.dimension,
            name: result.origin!.name,
            type: result.origin!.type,
          ),
          species: result.species,
          status: result.status,
        );
        await characterInfoLocal.saveCharacterInfo(result);
        return Right(entity);
      } on ServerException {
        return const Left(ServerFailure("Cannot connect to the server"));
      }
    } else {
      try {
        final result = await characterInfoLocal.getCharacterInfo(characterId);
        final entity = CharacterInfoEntity(
          gender: result.gender,
          id: result.id,
          image: result.image,
          location: LocationCharacterInfo(
              type: result.location!.type, name: result.location!.name, dimension: result.location!.dimension),
          name: result.name,
          origin: Origin(
            dimension: result.origin!.dimension,
            name: result.origin!.name,
            type: result.origin!.type,
          ),
          species: result.species,
          status: result.status,
        );
        return Right(entity);
      } on ServerException {
        return const Left(ServerFailure("Cannot find any data on local database"));
      }
    }
  }
}
