import 'package:flutter/material.dart';
import 'package:starwapp/constants/constants.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/views/pages/detail/widgets/description_list_widget.dart';
import 'package:starwapp/views/pages/detail/widgets/resume_widget.dart';
import 'package:starwapp/views/pages/detail/widgets/starships_list_widget.dart';
import 'package:starwapp/views/pages/detail/widgets/vehicles_list_widget.dart';
import 'package:starwapp/views/widgets/title_widget.dart';

class DetailPage extends StatefulWidget {
  final Character character;
  const DetailPage({Key? key, required this.character}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final tabs = [TAB_DESCRIPTION, TAB_VEHICLES, TAB_STARSHIPS];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(initialIndex: 0, vsync: this, length: tabs.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text(DETAIL_PAGE),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: widget.character.name!),
          ResumeWidget(gender: widget.character.gender!, birthYear: widget.character.birthYear!, homeworld: widget.character.homeworld!),
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
                          fontSize: 12,
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
              physics: const BouncingScrollPhysics(),
              controller: tabController,
              children: [
                DescriptionListWidget(
                  height: widget.character.height!,
                  mass: widget.character.mass!,
                  eyeColor: widget.character.eyeColor!,
                  hairColor: widget.character.hairColor!,
                  ),
                VehiclesListWidget(vehicles: widget.character.vehicles!,),
                StarshipsListWidget(starships: widget.character.starships!),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 6,
        icon: const Icon(Icons.report),
        label: const Text(REPORT_BUTTON_TITLE),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
