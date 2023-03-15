import 'package:exercise_uic/core/graphql/graphql_helper.dart';
import 'package:exercise_uic/core/utils/local_consts.dart';
import 'package:exercise_uic/features/character_info/data/datasources/character_info_local.dart';
import 'package:exercise_uic/features/character_info/data/datasources/character_info_remote.dart';
import 'package:exercise_uic/features/character_info/data/models/character_info_location_model.dart';
import 'package:exercise_uic/features/character_info/data/models/character_info_model.dart';
import 'package:exercise_uic/features/character_info/data/models/character_info_origin_model.dart';
import 'package:exercise_uic/features/character_info/data/repositores/character_info_repository_impl.dart';
import 'package:exercise_uic/features/character_info/domain/repositories/character_info_repository.dart';
import 'package:exercise_uic/features/character_info/domain/usecases/usescase.dart';
import 'package:exercise_uic/features/character_info/presentation/bloc/character_info_bloc.dart';
import 'package:exercise_uic/features/characters/data/datasources/all_characters_local.dart';
import 'package:exercise_uic/features/characters/data/datasources/all_characters_remote.dart';
import 'package:exercise_uic/features/characters/data/models/all_characters_model.dart';
import 'package:exercise_uic/features/characters/data/models/all_characters_location_model.dart';
import 'package:exercise_uic/features/characters/data/repositories/all_characters_repository_impl.dart';
import 'package:exercise_uic/features/characters/domain/repositories/all_characters_repsitory.dart';
import 'package:exercise_uic/features/characters/domain/usecases/usecase_all_characters.dart';
import 'package:exercise_uic/features/characters/presentation/bloc/all_characters_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/network/network_checker.dart';

final di = GetIt.instance;

init() async {
  // bloc
  di.registerFactory(() => AllCharactersBloc(di()));
  di.registerFactory(() => CharacterInfoBloc(di()));

  // Internet checker
  di.registerLazySingleton(() => InternetConnectionChecker());
  di.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(di()));

  // GraphQl
  di.registerLazySingleton<GraphQLClient>(() => GraphQlHelper().initGraphQlClient());

  // data sources
  di.registerLazySingleton<AllCharactersRemote>(() => AllCharactersRemoteImpl(di()));
  di.registerLazySingleton<AllCharactersLocal>(() => AllCharactersLocalImpl());

  di.registerLazySingleton<CharacterInfoRemote>(() => CharacterInfoRemoteImpl(di()));
  di.registerLazySingleton<CharacterInfoLocal>(() => CharacterInfoLocalImpl());

  // use cases
  di.registerLazySingleton(() => UsesCaseAllCharacters(di()));
  di.registerLazySingleton(() => UsesCaseCharacterInfo(di()));

  // Repositories
  di.registerLazySingleton<AllCharactersRepository>(
    () => AllCharactersRepositoryImpl(
      allCharactersLocal: di(),
      allCharactersRemote: di(),
      networkChecker: di(),
    ),
  );
  di.registerLazySingleton<CharacterInfoRepository>(
    () => CharacterInfoRepositoryImpl(
      networkChecker: di(),
      characterInfoLocal: di(),
      characterInfoRemote: di(),
    ),
  );

  // hive init
  await Hive.initFlutter();
  Hive.registerAdapter<AllCharactersModel>(AllCharactersModelAdapter());
  Hive.registerAdapter<Location>(LocationAdapter());
  Hive.registerAdapter<CharacterInfoModel>(CharacterInfoModelAdapter());
  Hive.registerAdapter<Origin>(OriginAdapter());
  Hive.registerAdapter<InfoLocation>(InfoLocationAdapter());
  await Hive.openBox<AllCharactersModel>(LocalConsts.allCharactersBox);
  await Hive.openBox<CharacterInfoModel>(LocalConsts.characterBox);
}
