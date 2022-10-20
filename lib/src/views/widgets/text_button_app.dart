import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const TextButtonApp({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
      child: TextButton(
        style: ButtonStyle(
          visualDensity: VisualDensity.standard,
          foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorDark),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14),
          child: Text(title),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
