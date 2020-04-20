import 'package:flutter/material.dart';

class MyNavigator {
  static void goToLoginPage(BuildContext context) async {
    await Navigator.pushReplacementNamed(context, "login");
  }

  static void goToHomePage(BuildContext context) async {
    await Navigator.pushReplacementNamed(context, "home");
  }
}
