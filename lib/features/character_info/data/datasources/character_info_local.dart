import 'package:exercise_uic/features/character_info/data/models/character_info_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/local_consts.dart';

abstract class CharacterInfoLocal {
  saveCharacterInfo(CharacterInfoModel characterInfoModel);

  Future<CharacterInfoModel> getCharacterInfo(String characterId);
}

class CharacterInfoLocalImpl implements CharacterInfoLocal {
  final box = Hive.box<CharacterInfoModel>(LocalConsts.characterBox);

  @override
  Future<CharacterInfoModel> getCharacterInfo(characterId) async {
    try {
      var result = box.values.toList().where((element) => element.id == characterId).first;
      if (result.id == "") {
        throw ServerException();
      }
      return Future.value(result);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  saveCharacterInfo(CharacterInfoModel characterInfoModel) {
    box.put(LocalConsts.characterBox, characterInfoModel);
  }
}
