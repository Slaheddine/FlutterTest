import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/localizations/AppLocalizations.dart';
import 'package:flutterapptest/myNavigator.dart';
import 'package:flutterapptest/services/ProfileServices.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/EditTextWidget.dart';
import 'package:flutterapptest/widgets/LoginButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<LoginPage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  GlobalKey<LoginButtonState> loginButtonKey = GlobalKey();
  bool loginError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Constants.backgroundColors,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                height: SizeConfig.blockSizeVertical * 14,
                width: SizeConfig.blockSizeHorizontal * 56,
              ),
              SizedBox(height: 50,),
              EditTextWidget(
                  isPassword: false,
                  controller: emailController,
                  hintText: AppLocalizations.of(context).translate("email")
              ),
              SizedBox(height: 20,),
              EditTextWidget(
                  isPassword: true,
                  controller: passwordController,
                  hintText: AppLocalizations.of(context).translate("password"),
              ),
              SizedBox(height: 30,),
              LoginButton(
                key: loginButtonKey,
                text: AppLocalizations.of(context).translate("login"),
                onPressed: () {
                  loginAction();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future loginAction() async {
    bool loggedIn = await ProfileServices.getInstance().login(emailController.text, passwordController.text);
    setState(() {
      loginError = !loggedIn;
    });
    loginButtonKey.currentState.setLoading(false);
    if(loggedIn) {
      MyNavigator.goToHomePage(context);
    }
  }
}
