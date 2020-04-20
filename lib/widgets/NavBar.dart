
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/constants.dart' as Constants;

class NavBar extends StatefulWidget {

  final onAllBooksClicked;
  final onSavedBooksClicked;

  NavBar({this.onAllBooksClicked, this.onSavedBooksClicked});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Constants.backgroundColorsBlur,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      height: SizeConfig.blockSizeVertical * 6,
      width: SizeConfig.blockSizeHorizontal * 50,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Spacer(),
            getSavedBookIconButton(),
            Spacer(),
            getAllBookIconButton(),
            Spacer(),
          ],
        ),
      );
  }

  Widget getSavedBookIconButton() {
    return Container(
      height: SizeConfig.blockSizeVertical * 6 * 0.5,
      width: SizeConfig.blockSizeVertical * 6 * 0.5,
      child: InkWell(
        customBorder: new CircleBorder(),
        onTap: () {

        },
        child: new Icon(
          Icons.bookmark,
          color: Constants.secondColor,
        ),
      ),
    );
  }

  Widget getAllBookIconButton() {
    return Container(
      height: SizeConfig.blockSizeVertical * 6 * 0.5,
      width: SizeConfig.blockSizeVertical * 6 * 0.5,
      child: InkWell(
        customBorder: new CircleBorder(),
        onTap: () {

        },
        child: new Icon(
          Icons.bookmark,
          color: Constants.secondColor,
        ),
      ),
    );
  }
}