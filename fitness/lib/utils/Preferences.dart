import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setEmail(String email) async =>
      await _preferences?.setString("email", email);

  static String getEmail() => _preferences?.getString("email") ?? "";
}