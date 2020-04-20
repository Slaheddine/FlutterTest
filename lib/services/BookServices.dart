
import 'dart:convert';

import 'package:flutterapptest/managers/SharedPreferencesManager.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/models/Profile.dart';
import 'package:flutterapptest/services/HttpManager.dart';

class BookServices extends HttpManager{

  static final BookServices _singleton = BookServices._internal();

  BookServices._internal() {
    //
  }

  factory BookServices() {
    return _singleton;
  }

  static BookServices getInstance() {
    return _singleton;
  }
  
  @override
  List castDynamicToList(listResponse) {
    List<Book> list = List<Book>.from(listResponse.map((i) => Book.fromJson(i)));
    return list;
  }

  @override
  castDynamicToObject(response) {
    return new Book.fromJson(response);
  }

  Future<List<Book>> mockBookList() async {
    await Future.delayed(const Duration(seconds: 2));
    Book b = Book(id: "5e8b51c22452b455e54ffc1822", volume: 1, title: "Le guide du voyageur galactique", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    Book b1 = Book(id: "5e8b51c22452b455e54ffc1811", volume: 1, title: "Le guide du voyageur galactique", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    Book b2 = Book(id: "5e8b51c22452b455e54ffc1844", volume: 1, title: "Le guide du voyageur galactique", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    List<Book> list = [b, b1, b2];
    return list;
  }
}