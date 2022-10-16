import 'package:flutter/material.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/models/starship.dart';
import 'package:starwapp/models/vehicle.dart';
import 'package:starwapp/views/pages/home/widgets/character_widget.dart';

class PeopleListWidget extends StatefulWidget {
  const PeopleListWidget({Key? key}) : super(key: key);

  @override
  State<PeopleListWidget> createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  List<Character> people = [
    Character(
      name: 'Luke Skywalker 1',
      birthYear: '15BBY',
      gender: 'male',
      height: '184',
      mass: '77',
      homeworld: 'Tierra',
      hairColor: 'brown',
      eyeColor: 'brown',
      vehicles: [
        Vehicle(name: 'name-2', model: 'model-2'),
        Vehicle(name: 'name-3', model: 'model-3'),
        Vehicle(name: 'name-4', model: 'model-4'),
      ],
      starships: [
        Starship(name: 'starship-1', model: 'model-1'),
        Starship(name: 'starship-2', model: 'model-2'),
      ],
    ),
    Character(
      name: 'Luke Skywalker 2',
      birthYear: '15BBY',
      gender: 'male',
      height: '184',
      homeworld: 'Tierra',
      mass: '77',
      hairColor: 'brown',
      eyeColor: 'brown',
      vehicles: [
        Vehicle(name: 'name-2', model: 'model-2'),
        Vehicle(name: 'name-3', model: 'model-3'),
        Vehicle(name: 'name-4', model: 'model-4'),
      ],
      starships: [
        Starship(name: 'starship-1', model: 'model-1'),
        Starship(name: 'starship-2', model: 'model-2'),
      ],
    ),
    Character(
      name: 'Luke Skywalker 3',
      birthYear: '15BBY',
      gender: 'male',
      height: '184',
      homeworld: 'Tierra',
      mass: '77',
      hairColor: 'brown',
      eyeColor: 'brown',
      vehicles: [
        Vehicle(name: 'name-2', model: 'model-2'),
        Vehicle(name: 'name-3', model: 'model-3'),
        Vehicle(name: 'name-4', model: 'model-4'),
      ],
      starships: [
        Starship(name: 'starship-1', model: 'model-1'),
        Starship(name: 'starship-2', model: 'model-2'),
      ],
    ),
    Character(
      name: 'Luke Skywalker 4',
      birthYear: '15BBY',
      gender: 'male',
      height: '184',
      homeworld: 'Tierra',
      mass: '77',
      hairColor: 'brown',
      eyeColor: 'brown',
      vehicles: [
        Vehicle(name: 'name-2', model: 'model-2'),
        Vehicle(name: 'name-3', model: 'model-3'),
        Vehicle(name: 'name-4', model: 'model-4'),
      ],
      starships: [
        Starship(name: 'starship-1', model: 'model-1'),
        Starship(name: 'starship-2', model: 'model-2'),
      ],
    ),
    Character(
      name: 'Luke Skywalker 5',
      birthYear: '15BBY',
      gender: 'male',
      height: '184',
      homeworld: 'Tierra',
      mass: '77',
      hairColor: 'brown',
      eyeColor: 'brown',
      vehicles: [
        Vehicle(name: 'name-2', model: 'model-2'),
        Vehicle(name: 'name-3', model: 'model-3'),
        Vehicle(name: 'name-4', model: 'model-4'),
      ],
      starships: [
        Starship(name: 'starship-1', model: 'model-1'),
        Starship(name: 'starship-2', model: 'model-2'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: people.length,
      itemBuilder: (context, index) {
        return CharacterWidget(character: people[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
          thickness: 1,
          color: Colors.teal.withOpacity(0.2),
        );
      },
    );
  }
}
