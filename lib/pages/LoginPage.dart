import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/localizations/AppLocalizations.dart';
import 'package:flutterapptest/services/ProfileServices.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/utils/SizeConfig.dart';

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
              Container(
                decoration: BoxDecoration(
                  color: Constants.backgroundColorsBlur,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 80,
                child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                        fontWeight: FontWeight.w300
                    ),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w100),
                        border: InputBorder.none,
                        hintText: AppLocalizations.of(context).translate("email"),
                    ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: Constants.backgroundColorsBlur,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 80,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w100),
                    border: InputBorder.none,
                    hintText: AppLocalizations.of(context).translate("password"),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                height: SizeConfig.blockSizeVertical * 5.5,
                minWidth: SizeConfig.blockSizeHorizontal * 50,
                color: Constants.secondColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0),
                ),
                child: Text(AppLocalizations.of(context).translate("login").toUpperCase(),
                    textAlign: TextAlign.center ,style: TextStyle(fontSize :17, fontWeight: FontWeight.normal, color: Colors.black,)),
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
