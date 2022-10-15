import 'package:flutter/material.dart';
import 'package:starwapp/views/pages/home/home_page.dart';

class Starwapp extends StatelessWidget {
  const Starwapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}