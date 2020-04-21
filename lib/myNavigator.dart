import 'package:flutter/material.dart';

import 'models/Book.dart';

class MyNavigator {
  static void goToLoginPage(BuildContext context) async {
    await Navigator.pushNamedAndRemoveUntil(context, "login", (Route<dynamic> route) => false);
  }

  static void goToHomePage(BuildContext context) async {
    await Navigator.pushReplacementNamed(context, "home");
  }

  static void goToDetailPage(BuildContext context, Book book) async {
    await Navigator.pushNamed(context, "detail", arguments: book);
  }


}
