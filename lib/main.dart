import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starwapp/app.dart';
import 'package:starwapp/services/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // orientacion vertical
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(const Starwapp());
}
