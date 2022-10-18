import 'package:flutter/material.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/utils/routes.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      title: Text(
        character.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        character.gender.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      visualDensity: VisualDensity.standard,
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.teal,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(detailPage, arguments: character);
      },
    );
  }
}
