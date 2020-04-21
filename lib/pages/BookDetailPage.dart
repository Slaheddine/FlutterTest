import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/localizations/AppLocalizations.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/myNavigator.dart';
import 'package:flutterapptest/services/ProfileServices.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/EditTextWidget.dart';
import 'package:flutterapptest/widgets/LoginButton.dart';

class BookDetailPage extends StatefulWidget {

  Book book;

  BookDetailPage(this.book);


  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<BookDetailPage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.backgroundColors,
        elevation: 0.0,
          leading: new IconButton(
            icon: Icon(Icons.close, color: Constants.secondColor),
            onPressed: () => Navigator.pop(context),
          )
      ),
      body: Container(
        color:  Constants.backgroundColors,
        child: Center(
          child: Column(

          ),
        ),
      ),
    );
  }
}
