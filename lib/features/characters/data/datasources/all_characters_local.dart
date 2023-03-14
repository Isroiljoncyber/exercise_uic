import 'dart:convert';

import 'package:exercise_uic/core/error/exceptions.dart';
import 'package:exercise_uic/core/utils/local_consts.dart';
import 'package:exercise_uic/features/characters/data/models/all_characters_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

abstract class AllCharactersLocal {
  Future<List<AllCharactersModel>> getLocal();

  saveAllCharacters(List<AllCharactersModel> allCharactersList);
}

class AllCharactersLocalImpl implements AllCharactersLocal {
  final box = Hive.box<AllCharactersModel>(LocalConsts.allCharactersBox);

  @override
  Future<List<AllCharactersModel>> getLocal() async {
    var result = box.values.toList();
    if (result.isEmpty) {
      throw ServerException();
    }
    result.sort((a, b) => a.id!.compareTo(b.id!));
    return result;
  }

  @override
  saveAllCharacters(List<AllCharactersModel> allCharactersList) {
    try {
      for (var element in allCharactersList) {
        box.put(element.id, element);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
