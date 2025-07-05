import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else {
      return prefs.setBool(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await prefs.remove(key);
  }
}
