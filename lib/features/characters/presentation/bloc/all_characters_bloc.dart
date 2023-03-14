import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/all_characters_entity.dart';
import '../../domain/usecases/usecase_all_characters.dart';

part 'all_characters_event.dart';

part 'all_characters_state.dart';

class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState> {
  final UsesCaseAllCharacters usesCaseAllCharacters;

  AllCharactersBloc(this.usesCaseAllCharacters) : super(LoadingState()) {
    on<GetAllCharactersEvent>((event, emit) => getAllCharacters(event, state));
  }

  Future<void> getAllCharacters(GetAllCharactersEvent event, AllCharactersState state) async {
    emit(LoadingState());
    final result = await usesCaseAllCharacters(CharactersParams());
    result.fold(
      (failure) {
        if (failure is ConnectionFailure) {
          emit(LoadingFailedState(
            message: failure.errorMessage,
          ));
        } else if (failure is ServerFailure) {
          emit(LoadingFailedState(
            message: failure.errorMessage,
          ));
        }
      },
      (result) => emit(SuccessfulLoadedState(allCharacterList: result)),
    );
  }
}
