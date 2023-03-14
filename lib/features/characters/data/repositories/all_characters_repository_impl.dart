import 'package:dartz/dartz.dart';
import 'package:exercise_uic/core/error/failures.dart';
import 'package:exercise_uic/core/network/network_checker.dart';
import 'package:exercise_uic/features/characters/data/datasources/all_characters_local.dart';
import 'package:exercise_uic/features/characters/domain/entities/all_characters_entity.dart';
import 'package:exercise_uic/features/characters/domain/entities/location_entity.dart';
import 'package:exercise_uic/features/characters/domain/repositories/all_characters_repsitory.dart';

import '../../../../core/error/exceptions.dart';
import '../datasources/all_characters_remote.dart';

class AllCharactersRepositoryImpl implements AllCharactersRepository {
  AllCharactersRepositoryImpl(
      {required this.allCharactersLocal, required this.allCharactersRemote, required this.networkChecker});

  final AllCharactersLocal allCharactersLocal;
  final AllCharactersRemote allCharactersRemote;
  final NetworkChecker networkChecker;

  @override
  Future<Either<Failure, List<AllCharactersEntity>>> getAllCharacters() async {
    if (await networkChecker.isNetWorkAvailable) {
      try {
        final result = await allCharactersRemote.getAllCharacters();
        final entity = result
            .map<AllCharactersEntity>((e) => AllCharactersEntity(
                id: e.id,
                image: e.image,
                name: e.name,
                status: e.status,
                location: Location(name: e.location!.name, type: e.location!.type)))
            .toList();
        await allCharactersLocal.saveAllCharacters(result);
        return Right(entity);
      } on ServerException {
        return const Left(ServerFailure("Cannot connect to the server"));
      }
    } else {
      try {
        final model = await allCharactersLocal.getLocal();
        final entity = model
            .map<AllCharactersEntity>((e) => AllCharactersEntity(
                id: e.id,
                image: e.image,
                name: e.name,
                status: e.status,
                location: Location(name: e.location!.name, type: e.location!.type)))
            .toList();
        return Right(entity);
      } on ServerException {
        return const Left(ServerFailure("Cannot find any data on local database"));
      }
    }
  }
}
