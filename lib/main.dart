import 'package:exercise_uic/di/dependency_injection.dart' as dependency_injection;
import 'package:exercise_uic/features/character_info/presentation/bloc/character_info_bloc.dart';
import 'package:exercise_uic/features/characters/presentation/bloc/all_characters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllCharactersBloc>(
          create: (context) => dependency_injection.di(),
        ),
        BlocProvider<CharacterInfoBloc>(
          create: (context) => dependency_injection.di(),
        ),
      ],
      child: MaterialApp(
        title: 'Exercise UIC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (setting) => Routes.generateRoutes(setting),
      ),
    );
  }
}
