import 'package:flutter/material.dart';
import 'package:starwapp/views/pages/detail/widgets/item_widget.dart';

class DescriptionListWidget extends StatelessWidget {
  final String height, mass, eyeColor, hairColor;
  const DescriptionListWidget({Key? key, required this.height, required this.mass, required this.eyeColor, required this.hairColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        ItemWidget(title: 'Altura', subtitle: height),
        Divider(
          height: 0,
          thickness: 1,
          color: Colors.teal.withOpacity(0.2),
        ),
        ItemWidget(title: 'Peso', subtitle: mass),
        Divider(
          height: 0,
          thickness: 1,
          color: Colors.teal.withOpacity(0.2),
        ),
        ItemWidget(title: 'Color de ojos', subtitle: eyeColor),
        Divider(
          height: 0,
          thickness: 1,
          color: Colors.teal.withOpacity(0.2),
        ),
        ItemWidget(title: 'Color de pelo', subtitle: hairColor),
      ]),
    );
  }
}
