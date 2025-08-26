import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> saveData(
      {required String key, required var value}) async {
    if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else {
      return await _prefs.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    return _prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clearData() async {
    return await _prefs.clear();
  }
}
