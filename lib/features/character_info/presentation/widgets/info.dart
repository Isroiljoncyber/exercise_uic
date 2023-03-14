import 'package:cached_network_image/cached_network_image.dart';
import 'package:exercise_uic/features/character_info/domain/entites/character_info_entity.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.entity,
  }) : super(key: key);

  final CharacterInfoEntity entity;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(25),
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.lightBlueAccent),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: entity.image ?? "",
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              entity.name ?? "",
              style: const TextStyle(fontSize: 28, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Gender: ${entity.gender}',
              style: const TextStyle(fontSize: 20, color: Colors.black26),
            ),
            const SizedBox(height: 10),
            Text(
              'Status:  ${entity.status}',
              style: TextStyle(
                  fontSize: 20,
                  color: (entity.status ?? "").toLowerCase().contains("alive") ? Colors.green : Colors.red),
            ),
            const SizedBox(height: 10),
            Text(
              'Species: ${entity.species}',
              style: const TextStyle(fontSize: 20, color: Colors.teal),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Text.rich(
                TextSpan(
                  text: "Origin info: \n",
                  children: [
                    TextSpan(
                      text: entity.origin!.name ?? "",
                    ),
                    TextSpan(text: "  ${entity.origin!.type ?? ""}  "),
                    TextSpan(text: entity.origin!.dimension ?? "")
                  ],
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                overflow: TextOverflow.clip,
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Text.rich(
                TextSpan(
                  text: "Location info: \n",
                  children: [
                    TextSpan(
                      text: entity.location!.name ?? "",
                    ),
                    TextSpan(text: "  ${entity.location!.type ?? ""}  "),
                    TextSpan(text: entity.location!.dimension ?? "")
                  ],
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.pinkAccent),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
