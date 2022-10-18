import 'package:flutter/material.dart';
import 'package:starwapp/constants/constants.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/services/user_preferences.dart';
import 'package:starwapp/views/pages/detail/widgets/description_list_widget.dart';
import 'package:starwapp/views/pages/detail/widgets/resume_widget.dart';
import 'package:starwapp/views/pages/detail/widgets/starships_list_widget.dart';
import 'package:starwapp/views/pages/detail/widgets/vehicles_list_widget.dart';
import 'package:starwapp/views/widgets/text_button_app.dart';
import 'package:starwapp/views/widgets/title_widget.dart';

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
          prefs.connection
              ? Container(
                  margin:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
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
              : TextButtonApp(title: REPORT_BUTTON_TITLE, onPressed: () {}),
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
