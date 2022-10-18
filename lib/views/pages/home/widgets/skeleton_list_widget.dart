import 'package:flutter/material.dart';
import 'package:starwapp/views/pages/home/widgets/skeleton_character_widget.dart';

class SkeletonListWidget extends StatelessWidget {
  const SkeletonListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, _) => const SkeletonCharacterWidget(),
      separatorBuilder: (context, _) => SizedBox(
        height: sizeScreen.height * 0.04,
      ),
    );
  }
}
