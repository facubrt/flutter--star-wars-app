import 'package:flutter/material.dart';
import 'package:starwapp/src/theme/color_app.dart';

class SkeletonResumeWidget extends StatelessWidget {
  const SkeletonResumeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: ColorApp.secondaryColor,
                width: sizeScreen.width * 0.2,
                height: sizeScreen.height * 0.04,
              ),
              SizedBox(
                height: sizeScreen.height * 0.01,
              ),
              Container(
                color: ColorApp.secondaryColor,
                width: sizeScreen.width * 0.2,
                height: sizeScreen.height * 0.02,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: ColorApp.secondaryColor,
                width: sizeScreen.width * 0.2,
                height: sizeScreen.height * 0.04,
              ),
              SizedBox(
                height: sizeScreen.height * 0.01,
              ),
              Container(
                color: ColorApp.secondaryColor,
                width: sizeScreen.width * 0.2,
                height: sizeScreen.height * 0.02,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: ColorApp.secondaryColor,
                width: sizeScreen.width * 0.2,
                height: sizeScreen.height * 0.04,
              ),
              SizedBox(
                height: sizeScreen.height * 0.01,
              ),
              Container(
                color: ColorApp.secondaryColor,
                width: sizeScreen.width * 0.2,
                height: sizeScreen.height * 0.02,
              ),
            ],
          )
        ],
      ),
    );
  }
}
