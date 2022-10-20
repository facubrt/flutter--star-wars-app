import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/data/local/user_preferences.dart';
import 'package:starwapp/src/provider/sw_provider.dart';
import 'package:starwapp/src/views/pages/home/widgets/character_widget.dart';
import 'package:starwapp/src/views/pages/home/widgets/skeleton_people_list_widget.dart';

class PeopleListWidget extends StatefulWidget {
  const PeopleListWidget({Key? key}) : super(key: key);

  @override
  State<PeopleListWidget> createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  ScrollController scrollController = ScrollController();
  final UserPreferences prefs = UserPreferences();

  @override
  void initState() {
    final swProvider = Provider.of<SWProvider>(context, listen: false);
    swProvider.getFirstPagePeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final swProvider = Provider.of<SWProvider>(context);
    return swProvider.isFirstLoadPeople
        ? const SkeletonPeopleListWidget()
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: swProvider.people.length + 1,
            itemBuilder: (context, index) {
              if (index < swProvider.people.length) {
                return CharacterWidget(
                  character: swProvider.people[index],
                  id: index,
                );
              } else {
                // FIN DE LISTA
                if (!swProvider.hasNextPage) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        'Fin de la lista',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  );
                }
                // SIN CONEXIÓN
                if (!prefs.connection) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        'No tienes conexión',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  );
                }

                swProvider.getPeople();
                return const Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
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
