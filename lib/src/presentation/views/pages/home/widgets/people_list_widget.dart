import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/presentation/logic/provider/sw_provider.dart';
import 'package:starwapp/src/presentation/views/pages/home/widgets/character_widget.dart';
import 'package:starwapp/src/presentation/views/pages/home/widgets/skeleton_list_widget.dart';

class PeopleListWidget extends StatefulWidget {
  const PeopleListWidget({Key? key}) : super(key: key);

  @override
  State<PeopleListWidget> createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  ScrollController scrollController = ScrollController();

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
        ? const SkeletonListWidget()
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: swProvider.people.length + 1,
            itemBuilder: (context, index) {
              if (index < swProvider.people.length) {
                return CharacterWidget(character: swProvider.people[index]);
              } else {
                if (!swProvider.hasNextPage) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColorDark,
                      child: Text(
                        'Fin de la lista',
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
