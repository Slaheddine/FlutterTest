
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/services/BookServices.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/MyIconButton.dart';

class VerticalBookItemWidget extends StatefulWidget {

  Book book;
  var onItemClicked;
  var onSaveAction;

  VerticalBookItemWidget({this.book, this.onItemClicked, this.onSaveAction});

  @override
  ItemState createState() => ItemState();
}

class ItemState extends State<VerticalBookItemWidget> {

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
          padding: const EdgeInsets.only(bottom : 10.0),
          child: Container(
            height: SizeConfig.blockSizeVertical*17,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal*25,
                    child: FadeInImage(
                        image: NetworkImage(widget.book.imageUrl),
                        placeholder: AssetImage("assets/images/placeholder.jpg")
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 10.0, bottom: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: SizeConfig.blockSizeHorizontal*60,
                        child: Text( widget.book.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: new TextStyle(fontSize :SizeConfig.blockSizeVertical * 2.7, fontWeight: FontWeight.w300, color: Constants.secondColor)
                        ),
                      ),
                      Spacer(),
                      Container(
                          width: SizeConfig.blockSizeHorizontal*60,
                          child: Text(widget.book.author,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: new TextStyle(fontSize :SizeConfig.blockSizeVertical * 2.1, fontWeight: FontWeight.w100, color: Constants.secondColor)
                          )
                      ),
                      Spacer(),
                      Padding(
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}