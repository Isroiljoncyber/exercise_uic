import 'package:exercise_uic/features/characters/data/models/all_characters_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/graphql/graphql_queries.dart';

abstract class AllCharactersRemote {
  Future<List<AllCharactersModel>> getAllCharacters();
}

class AllCharactersRemoteImpl implements AllCharactersRemote {
  AllCharactersRemoteImpl(this._graphQLClient);

  final GraphQLClient _graphQLClient;

  @override
  Future<List<AllCharactersModel>> getAllCharacters() async {
    try {
      final result = await _graphQLClient.query(
        QueryOptions(document: gql(Queries.getAllCharacters)),
      );
      if (result.data == null) return [];
      return result.data?['characters']['results']
          .map((e) => AllCharactersModel.fromJson(e))
          .cast<AllCharactersModel>()
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
