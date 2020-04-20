
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/MyIconButton.dart';

class HorizontalBookItemWidget extends StatefulWidget {

  Book book;

  HorizontalBookItemWidget(this.book);

  @override
  ItemState createState() => ItemState();
}

class ItemState extends State<HorizontalBookItemWidget> {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.blockSizeVertical * 28,
        width: SizeConfig.blockSizeHorizontal * 35,
        child: Stack(
            children: <Widget>[
              Image.network(
                  widget.book.imageUrl,
                  fit: BoxFit.cover
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right : 14.0, bottom: 10),
                  child: MyIconButton(
                    iconData: Icons.bookmark,
                    actionClick: () {

                    },
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}