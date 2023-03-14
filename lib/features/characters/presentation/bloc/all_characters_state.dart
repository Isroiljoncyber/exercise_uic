part of 'all_characters_bloc.dart';

abstract class AllCharactersState {}

class LoadingState extends AllCharactersState {}

class SuccessfulLoadedState extends AllCharactersState {
  SuccessfulLoadedState({required this.allCharacterList});

  final List<AllCharactersEntity> allCharacterList;
}

class LoadingFailedState extends AllCharactersState {
  LoadingFailedState({required this.message});
  final String message;
}
