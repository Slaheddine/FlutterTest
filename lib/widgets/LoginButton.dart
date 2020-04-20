
import 'package:flutter/material.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/constants.dart' as Constants;

class LoginButton extends StatefulWidget {

  final onPressed;
  String text;

  LoginButton({Key key, this.text, this.onPressed}) : super(key : key);

  @override
  LoginButtonState createState() => LoginButtonState();
}

class LoginButtonState extends State<LoginButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: SizeConfig.blockSizeVertical * 5.5,
      minWidth: SizeConfig.blockSizeHorizontal * 50,
      color: Constants.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(40.0),
      ),
      child: (!isLoading) ?
        Text(widget.text, textAlign: TextAlign.center ,style: TextStyle(fontSize :17, fontWeight: FontWeight.normal, color: Colors.black,)):
        SizedBox(
          height: SizeConfig.blockSizeVertical * 5.5 * 0.5,
          width: SizeConfig.blockSizeVertical * 5.5 * 0.5,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Constants.primaryColor),
            strokeWidth: 3,
          ),
        ),
      onPressed: () {
          action();
      },
    );
  }

  Future action() async {
    setState(() {
      isLoading = true;
    });
    widget.onPressed();
  }

  void setLoading(bool isloading) {
    setState(() {
      this.isLoading = isloading;
    });
  }
}