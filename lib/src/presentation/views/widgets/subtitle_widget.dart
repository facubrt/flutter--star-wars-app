import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String subtitle;
  const SubtitleWidget({Key? key, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
      child: Text(
        subtitle,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: size.width * 0.04,
          color: Colors.black54,
        ),
      ),
    );
  }
}
