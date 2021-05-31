import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPrefs _sharedPrefs;

  //region User Login
  addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = value;
    prefs.setBool(key, boolValue);
  }

  Future<bool> getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = false;
    if (prefs.containsKey(key)) {
      boolValue = prefs.getBool(key);
    }
    return boolValue;
  }
// endregion
}
