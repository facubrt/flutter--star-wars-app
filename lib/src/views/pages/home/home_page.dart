import 'package:flutter/material.dart';
import 'package:starwapp/src/constants/constants.dart';
import 'package:starwapp/src/views/pages/home/widgets/people_list_widget.dart';
import 'package:starwapp/src/views/widgets/subtitle_widget.dart';
import 'package:starwapp/src/views/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HOME_PAGE),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Column(children: const [
        TitleWidget(
          title: HOME_TITLE,
        ),
        SubtitleWidget(
          subtitle: HOME_SUBTITLE,
        ),
        Expanded(
          child: PeopleListWidget(),
        ),
      ]),
    );
  }
}
