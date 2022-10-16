import 'package:flutter/material.dart';
import 'package:starwapp/models/starship.dart';
import 'package:starwapp/views/pages/detail/widgets/item_widget.dart';

class StarshipsListWidget extends StatelessWidget {
  final List<Starship> starships;
  const StarshipsListWidget({Key? key, required this.starships}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: starships.length,
      itemBuilder: (context, index) {
        return ItemWidget(title: starships[index].name!, subtitle: starships[index].model!);
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
