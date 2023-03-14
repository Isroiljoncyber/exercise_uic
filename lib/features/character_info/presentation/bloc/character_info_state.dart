part of 'character_info_bloc.dart';

@immutable
abstract class CharacterInfoInitState {}

class LoadingState extends CharacterInfoInitState {}

class SuccessfulLoadedState extends CharacterInfoInitState {
  SuccessfulLoadedState({required this.characterInfoEntity});

  final CharacterInfoEntity characterInfoEntity;
}

class LoadingFailedState extends CharacterInfoInitState {
  LoadingFailedState({required this.message});

  final String message;
}
