import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  static final String _user_profile_key = "_user_profile_key";


  /// *************************************************************************/

  static Future<bool> isLoggedIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_user_profile_key) ?? false;
  }

  static Future<bool> setIsLoggedIn(bool isLogged) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_user_profile_key, isLogged);
  }

}
