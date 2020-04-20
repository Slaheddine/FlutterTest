import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/services/BookServices.dart';
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/HorizontalBookItemWidget.dart';
import 'package:flutterapptest/widgets/LoginButton.dart';
import 'package:flutterapptest/widgets/NavBar.dart';
import 'package:flutterapptest/widgets/VerticalBookItemWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<HomePage> {

  List<Book> allBooks = List();

  @override
  void initState() {
    super.initState();
    loadAllBook();
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
        centerTitle: true,
        title: RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(text: "Mavrin", style: new TextStyle(fontSize :SizeConfig.blockSizeVertical * 3, fontWeight: FontWeight.w300, color: Constants.secondColor)),
              new TextSpan(text: "Book", style: new TextStyle(fontSize :SizeConfig.blockSizeVertical * 3, fontWeight: FontWeight.bold, color: Constants.secondColor)),
            ],
          ),
        ),
      ),
      body: Container(
        color:  Constants.backgroundColors,
        child: Stack(
          children: <Widget>[
            getMainView(),
            Padding(
              padding: EdgeInsets.only(bottom : SizeConfig.blockSizeVertical * 2),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: NavBar(
                  onAllBooksClicked: () {},
                  onSavedBooksClicked: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future loadAllBook() async {
    List books = await BookServices.getInstance().mockBookList();
    setState(() {
      allBooks = books;
    });
  }

  Widget getMainView() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          getHorizontalBookList(),
          getVerticalBookList()
        ],
      ),
    );
  }

  Widget getHorizontalBookList() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
      child: Container(
        height: SizeConfig.blockSizeVertical * 28,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          reverse: false,
          padding: EdgeInsets.only(top: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount:allBooks.length,
          itemBuilder: (BuildContext context, int index) {
            return HorizontalBookItemWidget(allBooks[index]);
          },
        ),
      ),
    );
  }

  Widget getVerticalBookList() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: SizeConfig.blockSizeVertical * 10, left: 20),
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          reverse: false,
          padding: EdgeInsets.only(top: 5.0),
          scrollDirection: Axis.vertical,
          itemCount:allBooks.length,
          itemBuilder: (BuildContext context, int index) {
            return VerticalBookItemWidget(allBooks[index]);
          },
        ),
      ),
    );
  }

  //HorizontalBookItemWidget(allBooks[index])
}
