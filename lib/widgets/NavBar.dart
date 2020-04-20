
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/constants.dart' as Constants;

import 'MyIconButton.dart';

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
            getAllIcon(),
            Spacer(),
            getSavedIcon(),
            Spacer(),
          ],
        ),
      );
  }

  Widget getAllIcon() {
    return Container(
        height: SizeConfig.blockSizeVertical * 8 * 0.5,
        width: SizeConfig.blockSizeVertical * 8 * 0.5,
        child: InkWell(
          customBorder: new CircleBorder(),
          onTap: () {},
          child: new Icon(
            Icons.bookmark,
            color: Constants.secondColor,
          ),
        )
    );
  }

  Widget getSavedIcon() {
    return Container(
        height: SizeConfig.blockSizeVertical * 8 * 0.5,
        width: SizeConfig.blockSizeVertical * 8 * 0.5,
        child: InkWell(
          customBorder: new CircleBorder(),
          onTap: () {},
          child: new Icon(
            Icons.bookmark,
            color: Constants.secondColor,
          ),
        )
    );
  }
}