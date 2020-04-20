

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/constants.dart' as Constants;

class MyIconButton extends StatelessWidget {

  IconData iconData;
  var actionClick;

  MyIconButton({this.iconData, this.actionClick});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.7),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      height: SizeConfig.blockSizeVertical * 8 * 0.5,
      width: SizeConfig.blockSizeVertical * 8 * 0.5,
      child: InkWell(
          customBorder: new CircleBorder(),
          onTap: actionClick ?? () {},
          child: new Icon(
            iconData ?? Icons.bookmark,
            color: Constants.secondColor,
          ),
        )
    );
  }
  
}