import 'package:flutter/material.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/views/pages/home/widgets/character_widget.dart';

class PeopleListWidget extends StatefulWidget {
  final List<Character> people;
  const PeopleListWidget({Key? key, required this.people}) : super(key: key);

  @override
  State<PeopleListWidget> createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.people.length,
      itemBuilder: (context, index) {
        return CharacterWidget(character: widget.people[index]);
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
