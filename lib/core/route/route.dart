import 'package:exercise_uic/features/character_info/presentation/pages/character_info.dart';
import 'package:flutter/material.dart';
import '../../features/characters/presentation/pages/all_characters.dart';

class Routes {
  static const charactersPage = '/characters';
  static const characterInfoPage = '/character_info';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    final Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
    args ?? <String, dynamic>{};
    switch (routeSettings.name) {
      case charactersPage:
        return MaterialPageRoute(
          builder: (_) => const AllCharacters(),
        );
      case characterInfoPage:
        return MaterialPageRoute(
          builder: (_) => CharacterInfo(characterId: args?['characterId']),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AllCharacters(),
        );
    }
  }
}
