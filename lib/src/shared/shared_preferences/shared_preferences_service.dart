import "dart:convert";
import "package:shared_preferences/shared_preferences.dart";

class SharedPreferencesService {
  static Future<bool> save({required Map<String, dynamic> data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("card", jsonEncode(data));
  }

  static Future<bool> saveList(
      {required List<Map<String, dynamic>> data, required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(data));
  }

  static Future<String?> get({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
