import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/presentation/logic/provider/sw_provider.dart';
import 'package:starwapp/src/presentation/views/pages/detail/widgets/item_widget.dart';

class StarshipsListWidget extends StatelessWidget {
  final List<String> starships;
  const StarshipsListWidget({Key? key, required this.starships})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final peopleProvider = Provider.of<SWProvider>(context);
    return FutureBuilder(
        future: peopleProvider.getStarships(starships: starships),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: starships.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                    title: snapshot.data[index].model,
                    subtitle: snapshot.data[index].name);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.teal.withOpacity(0.2),
                );
              },
            );
          } else {
            return const Text('Cargando...');
          }
        });
  }
}
