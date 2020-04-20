import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/services/ProfileServices.dart';

class LoginPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<LoginPage> {

  bool showImage = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        showImage = true;
      });
    });

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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              opacity: (showImage) ? 1.0 : 0.0,
              child: Image.asset(
                "assets/images/splash_back.jpeg",
                fit: BoxFit.cover,
              ),
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
