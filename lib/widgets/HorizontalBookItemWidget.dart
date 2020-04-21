
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/services/BookServices.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/MyIconButton.dart';

class HorizontalBookItemWidget extends StatefulWidget {

  Book book;
  var onItemClicked;
  bool saveAction;
  double width;
  var onSaveAction;

  HorizontalBookItemWidget({this.width ,this.book, this.onItemClicked, this.saveAction = true, this.onSaveAction});

  @override
  ItemState createState() => ItemState();
}

class ItemState extends State<HorizontalBookItemWidget> {

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Constants.primaryColor,
      child: InkWell(
        onTap: () {
          if(widget.onItemClicked!=null) {
            widget.onItemClicked();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: SizeConfig.blockSizeVertical * 28,
            width: widget.width,
            child: Stack(
                    children: <Widget>[
                      FadeInImage(
                          image: NetworkImage(widget.book.imageUrl),
                          placeholder: AssetImage("assets/images/placeholder.jpg")
                      ),
                      if (widget.saveAction) Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right : 14.0, bottom: 10),
                          child: MyIconButton(
                            isMarked: BookServices.getInstance().isMarkedAsFavored(widget.book),
                            iconData: Icons.bookmark,
                            actionClick: () {
                              if(widget.onSaveAction!=null) {
                                widget.onSaveAction();
                              }
                            },
                          ),
                        ),
                      )
                    ]
                ),
              ),
        ),
      ),
    );
  }
}