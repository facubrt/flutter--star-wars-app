import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de conexión
  bool get connection {
    return _prefs.getBool('connection') ?? false;
  }

  set connection(bool connection) {
    _prefs.setBool('connection', !connection);
  }

  Future<bool> cleanPrefs() async {
    return _prefs.clear();
  }
}
