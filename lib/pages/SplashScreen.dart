import 'dart:async';

import 'package:flutter/material.dart';
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
    });


    /*
    Timer(Duration(seconds: 3), () => {

      ProfileServices.getInstance().userIsLogged().then((logged) {
        if(logged) {

        } else {
          MyNavigator.goToLoginPage(context);
        }
      })
    });
    */
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/images/splash_back.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
