

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/constants.dart' as Constants;

class LoaderWidget extends StatelessWidget {

  LoaderWidget();
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 5.5,
      width: SizeConfig.blockSizeVertical * 5.5,
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Constants.secondColor),
        strokeWidth: 3,
      ),
    );
  }
  
}