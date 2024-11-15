import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static final PrefHelper _prefHelper = PrefHelper._internal();

  factory PrefHelper() {
    return _prefHelper;
  }

  PrefHelper._internal();

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return prefs.getString(key);
  }

  void setString(String key, String value) {
    prefs.setString(key, value);
  }

  int? getInt(String key) {
    return prefs.getInt(key);
  }

  void setInt(String key, int value) {
    prefs.setInt(key, value);
  }

  bool getBool(String key,bool defaultValue) {
    return prefs.getBool(key) ?? defaultValue;
  }

  void setBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  clearPreference() {
    try {
      prefs.clear();
    } catch (e) {
      return null;
    }
  }
}
