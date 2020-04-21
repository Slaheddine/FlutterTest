

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/constants.dart' as Constants;

class MyIconButton extends StatelessWidget {

  IconData iconData;
  var actionClick;
  bool isMarked = false;
  bool largeMode = false;

  MyIconButton({this.iconData, this.actionClick, this.isMarked = true, this.largeMode = false});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isMarked) ? Constants.secondColor : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      height: (!largeMode) ?  SizeConfig.blockSizeVertical * 8 * 0.5 : SizeConfig.blockSizeVertical * 8 * 0.6,
      width: (!largeMode) ? SizeConfig.blockSizeVertical * 8 * 0.5 : SizeConfig.blockSizeVertical * 8 ,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: (isMarked) ? 0 : 20, sigmaY: (isMarked) ? 0 : 20),
            child: InkWell(
                customBorder: new CircleBorder(),
                onTap: actionClick ?? () {},
                child: new Icon(
                  iconData ?? Icons.bookmark,
                  color: (!isMarked) ? Constants.secondColor : Colors.transparent.withOpacity(0.7),
                ),
              ),
          ),
        ),
      )
    );
  }
  
}