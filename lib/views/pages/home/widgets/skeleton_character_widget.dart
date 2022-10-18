import 'package:flutter/material.dart';
import 'package:starwapp/theme/color_app.dart';

class SkeletonCharacterWidget extends StatelessWidget {
  const SkeletonCharacterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorApp.secondaryColor,
            width: sizeScreen.width * 0.2,
            height: sizeScreen.height * 0.02,
          ),
          SizedBox(
            height: sizeScreen.height * 0.01,
          ),
          Container(
            color: ColorApp.secondaryColor,
            width: sizeScreen.width * 0.8,
            height: sizeScreen.height * 0.04,
          ),
        ],
      ),
    );
  }
}
