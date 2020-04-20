import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/myNavigator.dart';
import 'package:flutterapptest/services/ProfileServices.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      SizeConfig().init(context);
      setState(() {});
    });


    Timer(Duration(seconds: 2), () => {

      ProfileServices.getInstance().userIsLogged().then((logged) {
        if(logged) {

        } else {
          MyNavigator.goToLoginPage(context);
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
    return Container(
      color:  Constants.backgroundColors,
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.fill,
          height: SizeConfig.blockSizeVertical * 14,
          width: SizeConfig.blockSizeHorizontal * 56,
        ),
      ),
    );
  }
}
