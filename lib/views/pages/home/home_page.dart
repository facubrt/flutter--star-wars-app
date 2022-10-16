import 'package:flutter/material.dart';
import 'package:starwapp/views/pages/home/widgets/people_list_widget.dart';
import 'package:starwapp/views/widgets/subtitle_widget.dart';
import 'package:starwapp/views/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        elevation: 0,
      ),
      body: Column(children: const [
        TitleWidget(
          title: '¡Que la fuerza te acompañe!',
        ),
        SubtitleWidget(
          subtitle: 'Reporta los personajes de Star Wars avistados en la tierra sin que te descubran',
        ),
        Expanded(
          child: PeopleListWidget(),
        ),
      ]),
    );
  }
}
