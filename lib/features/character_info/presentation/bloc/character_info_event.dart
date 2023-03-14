part of 'character_info_bloc.dart';

@immutable
abstract class CharacterInfoEvent {}

class GetCharacterInfo extends CharacterInfoEvent {
  GetCharacterInfo(this.characterId);
  final String characterId;
}
