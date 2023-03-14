import 'package:exercise_uic/features/characters/presentation/bloc/all_characters_bloc.dart';
import 'package:exercise_uic/features/characters/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCharacters extends StatefulWidget {
  const AllCharacters({Key? key}) : super(key: key);

  @override
  State<AllCharacters> createState() => _CharactersState();
}

class _CharactersState extends State<AllCharacters> {
  @override
  void initState() {
    BlocProvider.of<AllCharactersBloc>(context).add(GetAllCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Rick and Morty Characters",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<AllCharactersBloc>(context).add(GetAllCharactersEvent());
          },
          child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadingFailedState) {
                return ListView(
                  children: [
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red, fontSize: 15),
                          )),
                    ),
                    const SizedBox.shrink(),
                  ],
                );
              } else if (state is SuccessfulLoadedState) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.allCharacterList.length,
                  itemBuilder: (context, index) {
                    var item = state.allCharacterList[index];
                    return CharacterItem(
                      characterEntity: item,
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
