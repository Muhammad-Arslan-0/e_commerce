import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static Future setThemeToPref(bool theme) async {
    SharedPreferences themePref = await SharedPreferences.getInstance();
    await themePref.setBool("theme", theme);
  }

  static Future<bool?> getThemeFromPref() async {
    SharedPreferences themePref = await SharedPreferences.getInstance();
    return await themePref.getBool("theme");
  }

  static Future removeThemeFromPref() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    userPref.clear();
  }
}
