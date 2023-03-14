import 'package:cached_network_image/cached_network_image.dart';
import 'package:exercise_uic/features/characters/domain/entities/all_characters_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/route/route.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.characterEntity}) : super(key: key);

  final AllCharactersEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.characterInfoPage, arguments: {'characterId': characterEntity.id});
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.teal),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: characterEntity.image!,
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    characterEntity.name ?? "",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    'Status: ${characterEntity.status ?? ""}',
                    style: const TextStyle(fontSize: 15, color: Colors.cyanAccent),
                  ),
                  Text(
                    'Planet: ${characterEntity.location!.name ?? ""}',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(fontSize: 15, color: Colors.deepPurple),
                  ),
                  Text(
                    'Planet Type : ${characterEntity.location!.type ?? ""}',
                    style: const TextStyle(fontSize: 15, color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
