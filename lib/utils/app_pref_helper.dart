import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const accessTokenKey = 'access-token';

  static SharedPreferences? preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void clear() {
    preferences?.clear();
  }

  static void logout() {
    preferences?.remove(accessTokenKey);
  }

  static void storeAccessToken(String? accessToken) {
    preferences?.setString(accessTokenKey, accessToken ?? "");
  }

  static String? get accessToken => preferences?.getString(accessTokenKey);
}
