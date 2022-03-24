import 'package:shared_preferences/shared_preferences.dart';

enum PreferencesKey { token, firstLoginApp, login, user, }

class LocaleManager{
   static final LocaleManager _instace = LocaleManager._init();
  SharedPreferences? _preferences;
  static LocaleManager get instance => _instace;
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<bool> clearWithoutFirstLogin() async {
    await _preferences?.clear();
    await setBoolValue(PreferencesKey.firstLoginApp, false);
    return true;
  }


  Future<void> setStringValue(PreferencesKey key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKey key) => _preferences!.getString(key.toString()) ?? '';
  
  Future<void> setBoolValue(PreferencesKey key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  bool? getBoolValue(PreferencesKey key) => _preferences!.getBool(key.toString());

}