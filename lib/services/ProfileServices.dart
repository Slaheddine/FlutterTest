
import 'dart:convert';

import 'package:flutterapptest/managers/SharedPreferencesManager.dart';

class ProfileServices {

  final String loggedEmail = "a";
  final String loggedPassword = "b";

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
    bool isLogged = await SharedPreferencesManager.isLoggedIn();
    return isLogged ;
  }

  Future setIsLogged(bool isLogged) async {
    await SharedPreferencesManager.setIsLoggedIn(isLogged);
  }

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    setIsLogged(((email == loggedEmail) && (password == loggedPassword)));
    return ((email == loggedEmail) && (password == loggedPassword));
  }

  Future logOut() async {
    await Future.delayed(const Duration(seconds: 2));
    setIsLogged(false);
  }
}