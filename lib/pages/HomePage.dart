import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/localizations/AppLocalizations.dart';
import 'package:flutterapptest/services/ProfileServices.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/LoginButton.dart';

class HomePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<HomePage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  GlobalKey<LoginButtonState> loginButtonKey = GlobalKey();
  bool loginError = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => {

      ProfileServices.getInstance().userIsLogged().then((logged) {
        if(logged) {

        } else {

        }
      })
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.backgroundColors,
        elevation: 0.0,
        title: Text("az"),
      ),
      body: Container(
        color:  Constants.backgroundColors,
      ),
    );
  }
}
