
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

  bool allBookSelected = true;

  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
            color: Constants.backgroundColorsBlur.withOpacity(0.4),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          height: SizeConfig.blockSizeVertical * 6,
          width: SizeConfig.blockSizeHorizontal * 50,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
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
              ),
            ),
          ),
    );
  }

  Widget getAllIcon() {
    return Container(
        height: SizeConfig.blockSizeVertical * 8 * 0.3,
        width: SizeConfig.blockSizeVertical * 8 * 0.3,
        child: InkWell(
          customBorder: new CircleBorder(),
          onTap: () {
            widget.onAllBooksClicked();
            setState(() {
              allBookSelected = true;
            });
          },
          child: Image.asset(
              (allBookSelected) ? "assets/images/ic_book.png" : "assets/images/ic_books_default.png"
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
          onTap: () {
            widget.onSavedBooksClicked();
            setState(() {
              allBookSelected = false;
            });
          },
          child: new Icon(
            Icons.bookmark,
            color: (!allBookSelected) ? Constants.secondColor : Constants.secondColor.withOpacity(0.3),
          ),
        )
    );
  }
}