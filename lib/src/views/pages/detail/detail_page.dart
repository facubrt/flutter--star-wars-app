import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/constants/constants.dart';
import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/data/local/user_preferences.dart';
import 'package:starwapp/src/data/models/report.dart';
import 'package:starwapp/src/views/pages/detail/widgets/description_list_widget.dart';
import 'package:starwapp/src/views/pages/detail/widgets/resume_widget.dart';
import 'package:starwapp/src/views/pages/detail/widgets/starships_list_widget.dart';
import 'package:starwapp/src/views/pages/detail/widgets/vehicles_list_widget.dart';
import 'package:starwapp/src/views/widgets/text_button_app.dart';
import 'package:starwapp/src/views/widgets/title_widget.dart';

import '../../../provider/sw_provider.dart';

class DetailPage extends StatefulWidget {
  final Character character;
  const DetailPage({Key? key, required this.character}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final tabs = [TAB_DESCRIPTION, TAB_VEHICLES, TAB_STARSHIPS];
  final UserPreferences prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(initialIndex: 0, vsync: this, length: tabs.length);
    final swProvider = Provider.of<SWProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(DETAIL_PAGE),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: widget.character.name),
          !prefs.connection
              ? Container(
                  margin:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                      ),
                      Flexible(
                        child: Text(
                          MSG_NOT_CONNECTION,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : TextButtonApp(
                  title: REPORT_BUTTON_TITLE,
                  onPressed: () async {
                    final _report = Report(
                      id: swProvider.idCharacter,
                      date: DateTime.now().toString(),
                      name: widget.character.name,
                    );
                    final String? resultMsg =
                        await swProvider.postReport(report: _report);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        margin: const EdgeInsets.all(20.0),
                        content: Text(
                          'Status: $resultMsg',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
          ResumeWidget(
              gender: widget.character.gender,
              birthYear: widget.character.birth_year,
              homeworld: widget.character.homeworld),
          TabBar(
            padding: const EdgeInsets.all(40.0),
            indicatorColor: Colors.black,
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black26,
            tabs: tabs
                .map(
                  (collection) => Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        collection.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                DescriptionListWidget(
                  height: widget.character.height,
                  mass: widget.character.mass,
                  eyeColor: widget.character.eye_color,
                  hairColor: widget.character.hair_color,
                ),
                VehiclesListWidget(
                  vehicles:
                      widget.character.vehicles!, //widget.character.vehicles!,
                ),
                StarshipsListWidget(
                  starships:
                      widget.character.starships!, //widget.character.starships!
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
