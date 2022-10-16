import 'package:flutter/material.dart';

class PropertyWidget extends StatelessWidget {
  final String property;
  const PropertyWidget({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      property,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
        ),
    );
  }
}
