
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/constants.dart' as Constants;

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
      child: Image.network(
          widget.book.imageUrl,
          fit: BoxFit.cover
      ),
    );
  }
}