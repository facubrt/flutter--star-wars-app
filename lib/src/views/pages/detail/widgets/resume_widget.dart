import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/provider/sw_provider.dart';
import 'package:starwapp/src/views/pages/detail/widgets/property_title_widget.dart';
import 'package:starwapp/src/views/pages/detail/widgets/property_widget.dart';
import 'package:starwapp/src/views/pages/detail/widgets/skeleton_resume_widget.dart';

class ResumeWidget extends StatelessWidget {
  final String gender, birthYear, homeworld;
  const ResumeWidget(
      {Key? key,
      required this.gender,
      required this.birthYear,
      required this.homeworld})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final swProvider = Provider.of<SWProvider>(context);
    return FutureBuilder(
      future: swProvider.getCharacterHomeworld(homeworld: homeworld),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const PropertyTitleWidget(property: 'género'),
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
                    PropertyWidget(property: snapshot.data.toString()),
                  ],
                )
              ],
            ),
          );
        } else {
          return const SkeletonResumeWidget();
        }
      },
    );
  }
}
