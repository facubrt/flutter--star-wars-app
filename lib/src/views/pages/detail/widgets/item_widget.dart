import 'package:flutter/material.dart';
import 'package:starwapp/src/views/pages/detail/widgets/property_title_widget.dart';
import 'package:starwapp/src/views/pages/detail/widgets/property_widget.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ItemWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      title: PropertyTitleWidget(property: title),
      subtitle: PropertyWidget(property: subtitle),
      visualDensity: VisualDensity.standard,
    );
  }
}
