import 'package:bloc/bloc.dart';
import 'package:exercise_uic/features/character_info/domain/entites/character_info_entity.dart';
import 'package:exercise_uic/features/character_info/domain/usecases/usescase.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';

part 'character_info_event.dart';

part 'character_info_state.dart';

class CharacterInfoBloc extends Bloc<CharacterInfoEvent, CharacterInfoInitState> {
  CharacterInfoBloc(this._usesCaseCharacterInfo) : super(LoadingState()) {
    on<GetCharacterInfo>((event, emit) => getCharacterInfo(event, state));
  }

  final UsesCaseCharacterInfo _usesCaseCharacterInfo;

  Future<void> getCharacterInfo(GetCharacterInfo event, CharacterInfoInitState state) async {
    emit(LoadingState());
    final result = await _usesCaseCharacterInfo(CharactersParams(event.characterId));
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
      (result) => emit(SuccessfulLoadedState(characterInfoEntity: result)),
    );
  }
}
