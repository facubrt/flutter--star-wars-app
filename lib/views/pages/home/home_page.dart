import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/constants/constants.dart';
import 'package:starwapp/provider/people_provider.dart';
import 'package:starwapp/views/pages/home/widgets/people_list_widget.dart';
import 'package:starwapp/views/widgets/subtitle_widget.dart';
import 'package:starwapp/views/widgets/title_widget.dart';

import 'widgets/skeleton_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final peopleProvider = Provider.of<PeopleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(HOME_PAGE),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Column(children: [
        const TitleWidget(
          title: HOME_TITLE,
        ),
        const SubtitleWidget(
          subtitle: HOME_SUBTITLE,
        ),
        Expanded(
          child: FutureBuilder(
            future: peopleProvider.getPeople(page: 2),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return PeopleListWidget(people: snapshot.data);
              } else {
                return const SkeletonListWidget();
              }
            },
          ),
        ),
      ]),
    );
  }
}
