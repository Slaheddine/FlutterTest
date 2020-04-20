
import 'package:flutter/material.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/constants.dart' as Constants;

class EditTextWidget extends StatefulWidget {
  
  String hintText;
  bool isPassword;
  TextEditingController controller;

  EditTextWidget({this.controller, this.hintText, this.isPassword});

  @override
  EditTextWidgetState createState() => EditTextWidgetState();
}

class EditTextWidgetState extends State<EditTextWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.backgroundColorsBlur,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      height: SizeConfig.blockSizeVertical * 6,
      width: SizeConfig.blockSizeHorizontal * 80,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w300
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w100),
          border: InputBorder.none,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}