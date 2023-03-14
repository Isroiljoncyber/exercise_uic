import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/graphql/graphql_queries.dart';
import '../models/character_info_model.dart';

abstract class CharacterInfoRemote {
  Future<CharacterInfoModel> getCharacterInfo(String characterId);
}

class CharacterInfoRemoteImpl implements CharacterInfoRemote {
  CharacterInfoRemoteImpl(this._graphQLClient);

  final GraphQLClient _graphQLClient;

  @override
  Future<CharacterInfoModel> getCharacterInfo(characterId) async {
    try {
      final result = await _graphQLClient.query(
        QueryOptions(
            document: gql(Queries.getRequiredCharacter), variables: <String, String>{'characterId': characterId}),
      );
      if (result.data == null) return CharacterInfoModel();
      return CharacterInfoModel.fromJson(result.data?['character']);
    } catch (e) {
      throw Exception(e);
    }
  }
}
