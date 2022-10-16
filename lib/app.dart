import 'package:flutter/material.dart';
import 'package:starwapp/utils/routes.dart';

class Starwapp extends StatelessWidget {
  const Starwapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars Challenge',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.teal,
        splashColor: Colors.teal.withOpacity(0.2),
        highlightColor: Colors.teal.withOpacity(0.1)
      ),
      initialRoute: basePage,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}