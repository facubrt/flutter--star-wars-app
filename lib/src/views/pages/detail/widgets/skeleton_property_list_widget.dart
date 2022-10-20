import 'package:flutter/material.dart';
import 'package:starwapp/src/theme/color_app.dart';

class SkeletonPropertyListWidget extends StatelessWidget {
  const SkeletonPropertyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorApp.secondaryColor,
                width: sizeScreen.width * 0.8,
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
        );
      },
      separatorBuilder: (context, _) => SizedBox(
        height: sizeScreen.height * 0.04,
      ),
    );
  }
}
