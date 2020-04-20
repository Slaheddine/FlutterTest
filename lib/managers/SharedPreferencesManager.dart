import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  static final String _user_profile_key = "_user_profile_key";


  /// *************************************************************************/

  static Future<String> getUserProfileJSON() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_user_profile_key) ?? null;
  }

  static Future<bool> setUserProfileJSON(String json) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_user_profile_key, json);
  }

}
