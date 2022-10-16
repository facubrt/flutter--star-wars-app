import 'package:flutter/material.dart';

class PropertyTitleWidget extends StatelessWidget {
  final String property;
  const PropertyTitleWidget({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      property.toUpperCase(),
      style: const TextStyle(
        color: Colors.black38,
        fontSize: 12,
      ),
    );
  }
}
