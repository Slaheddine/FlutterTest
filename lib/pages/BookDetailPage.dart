import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapptest/localizations/AppLocalizations.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/myNavigator.dart';
import 'package:flutterapptest/services/BookServices.dart';
import 'package:flutterapptest/services/ProfileServices.dart';
import 'package:flutterapptest/constants.dart' as Constants;
import 'package:flutterapptest/utils/SizeConfig.dart';
import 'package:flutterapptest/widgets/EditTextWidget.dart';
import 'package:flutterapptest/widgets/HorizontalBookItemWidget.dart';
import 'package:flutterapptest/widgets/LoaderWidget.dart';
import 'package:flutterapptest/widgets/LoginButton.dart';
import 'package:flutterapptest/widgets/MyIconButton.dart';

class BookDetailPage extends StatefulWidget {

  Book book;
  BookDetailPage(this.book);


  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<BookDetailPage> {

  List<Book> savedBooks = List();
  bool isLoadingSavedBook = true;

  @override
  void initState() {
    super.initState();
    loadSavedBook();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies(
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Constants.backgroundColors,
          elevation: 0.0,
          leading: new IconButton(
            icon: Icon(
                Icons.close, color: Constants.secondColor
            ),
            onPressed: () =>
                Navigator.pop(
                    context
                ),
          )
      ),
      body: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        color: Constants.backgroundColors,
        child: bookDetail(
        ),
      ),
    );
  }

  Widget bookDetail() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FadeInImage(
            height: SizeConfig.blockSizeVertical * 40,
            width: SizeConfig.blockSizeHorizontal * 50,
            image: NetworkImage(
                widget.book.imageUrl
            ),
            placeholder: AssetImage(
                "assets/images/placeholder.jpg"
            )
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal * 80,
          child: Text(
              widget.book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: SizeConfig.blockSizeVertical * 3.5,
                  fontWeight: FontWeight.w300,
                  color: Constants.secondColor
              )
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            width: SizeConfig.blockSizeHorizontal * 80,
            child: Text(
                widget.book.author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 2.4,
                    fontWeight: FontWeight.w100,
                    color: Constants.secondColor
                )
            )
        ),
        SizedBox(
          height: 20,
        ),
        MyIconButton(
          largeMode: true,
          iconData: Icons.bookmark,
          actionClick: () {
            saveOrDeleteBookFavored(widget.book, !BookServices.getInstance().isMarkedAsFavored(widget.book));
          },
          isMarked: BookServices.getInstance().isMarkedAsFavored(widget.book),
        ),
        Spacer(),
        getSavedBookList(),
        Spacer(),
      ],
    );
  }

  Widget getSavedBookList() {
    return Padding(
      padding: EdgeInsets.only(
          top: 20, bottom: 20, left: 20
      ),
      child: Container(
        height: SizeConfig.blockSizeVertical * 18,
        child: (!isLoadingSavedBook) ? ListView.builder(
          physics: AlwaysScrollableScrollPhysics(
          ),
          reverse: false,
          padding: EdgeInsets.only(
              top: 5.0
          ),
          scrollDirection: Axis.horizontal,
          itemCount: savedBooks.length,
          itemBuilder: (BuildContext context, int index) {
            return HorizontalBookItemWidget(
              width: SizeConfig.blockSizeHorizontal * 20,
              saveAction: false,
              book: savedBooks[index],
              onItemClicked: () {
                setState(() {
                  widget.book = savedBooks[index];
                });
              },
            );
          },
        )
        : Center(
          child: LoaderWidget(),
        ),
      ),
    );
  }

  Future loadSavedBook() async {
    List books = await BookServices.getInstance().getSavedBooks();
    setState(() {
      savedBooks = books;
      isLoadingSavedBook = false;
    });
  }

  void saveOrDeleteBookFavored(Book book, bool toSave) {
    if(toSave) {
      BookServices.getInstance().markBookAsFavored(book);
    } else {
      BookServices.getInstance().removeBookAsFavored(book);
    }
    loadSavedBook();
  }
}
