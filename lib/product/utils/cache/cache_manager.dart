import '../../../core/init/locale/locale_manager.dart';

class CacheManager{

  static Future<void> clearWithoutFirstLogin() async {
    await LocaleManager.instance.clearWithoutFirstLogin();
  }

  static Future<void> saveStringData(PreferencesKey key, String string) async {
    await LocaleManager.instance.setStringValue(key, string);
  }

   static String? getStringData(PreferencesKey key) {
    return LocaleManager.instance.getStringValue(key);
  }

  static bool getBoolData(PreferencesKey key) {
    return LocaleManager.instance.getBoolValue(key) ?? false;
    }

  static Future<void> saveBoolData(PreferencesKey key, bool value) async {
    await LocaleManager.instance.setBoolValue(key, value);
  }
}