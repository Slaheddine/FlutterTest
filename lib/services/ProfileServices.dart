
import 'dart:convert';

import 'package:flutterapptest/managers/SharedPreferencesManager.dart';
import 'package:flutterapptest/models/Profile.dart';

class ProfileServices {

  static final ProfileServices _singleton = ProfileServices._internal();

  ProfileServices._internal() {
    //
  }

  factory ProfileServices() {
    return _singleton;
  }

  static ProfileServices getInstance() {
    return _singleton;
  }

  Future<bool> userIsLogged() async {
    String profileJson = await SharedPreferencesManager.getUserProfileJSON();
    return profileJson != null ;
  }

  Future saveUser(String login, String password) async {
    Profile profile = Profile(login: login, password: password);
    await SharedPreferencesManager.setUserProfileJSON(json.encode(profile));
  }
}