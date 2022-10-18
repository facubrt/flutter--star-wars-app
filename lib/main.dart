import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/app.dart';
import 'package:starwapp/provider/people_provider.dart';
import 'package:starwapp/services/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // orientacion vertical
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = UserPreferences();
  await prefs.initPrefs();
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => PeopleProvider(),
        ),
      ],
      child: const Starwapp(),
    ),
  );
}
