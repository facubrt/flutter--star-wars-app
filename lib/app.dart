import 'package:flutter/material.dart';
import 'package:starwapp/constants/constants.dart';
import 'package:starwapp/theme/color_app.dart';
import 'package:starwapp/utils/routes.dart';

class Starwapp extends StatelessWidget {
  const Starwapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorApp.primaryColor,
        primaryColor: ColorApp.primaryColor,
        primaryColorDark: ColorApp.primaryColorDark,
        fontFamily: 'Poppins',
      ),
      initialRoute: basePage,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
