import 'package:exercise_uic/features/character_info/presentation/bloc/character_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/info.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({Key? key, required this.characterId}) : super(key: key);

  final String characterId;

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  @override
  void initState() {
    BlocProvider.of<CharacterInfoBloc>(context).add(GetCharacterInfo(widget.characterId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Info",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CharacterInfoBloc, CharacterInfoInitState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadingFailedState) {
              return Center(
                  child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ));
            } else if (state is SuccessfulLoadedState) {
              return Info(entity: state.characterInfoEntity);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
