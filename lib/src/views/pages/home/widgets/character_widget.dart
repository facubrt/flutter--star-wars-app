import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/provider/sw_provider.dart';
import 'package:starwapp/src/utils/routes.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final int id;
  const CharacterWidget({Key? key, required this.character, required this.id})
      : super(key: key);

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
        final swProvider = Provider.of<SWProvider>(context, listen: false);
        swProvider.idCharacter = id;
        Navigator.of(context).pushNamed(detailPage, arguments: character);
      },
    );
  }
}
