import 'package:flutter/material.dart';
import 'package:starwapp/views/pages/detail/widgets/property_title_widget.dart';
import 'package:starwapp/views/pages/detail/widgets/property_widget.dart';

class ResumeWidget extends StatelessWidget {
  final String gender, birthYear, homeworld;
  const ResumeWidget({Key? key, required this.gender, required this.birthYear, required this.homeworld}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const PropertyTitleWidget(property: 'gender'),
              PropertyWidget(property: gender),
            ],
          ),
          Column(
            children: [
              const PropertyTitleWidget(property: 'nacimiento'),
              PropertyWidget(property: birthYear),
            ],
          ),
          Column(
            children: [
              const PropertyTitleWidget(property: 'Mundo natal'),
              PropertyWidget(property: homeworld),
            ],
          )
        ],
      ),
    );
  }
}
