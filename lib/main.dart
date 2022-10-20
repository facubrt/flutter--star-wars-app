import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/app.dart';
import 'package:starwapp/src/presentation/logic/provider/sw_provider.dart';
import 'package:starwapp/src/presentation/logic/services/user_preferences.dart';

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
          create: (BuildContext context) => SWProvider(),
        ),
      ],
      child: const Starwapp(),
    ),
  );
}
