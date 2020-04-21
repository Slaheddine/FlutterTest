
import 'dart:convert';

import 'package:flutterapptest/managers/SharedPreferencesManager.dart';
import 'package:flutterapptest/models/Book.dart';
import 'package:flutterapptest/models/Profile.dart';
import 'package:flutterapptest/services/HttpManager.dart';

class BookServices extends HttpManager{

  static final BookServices _singleton = BookServices._internal();

  List<Book> _allMockBook = List();
  List<Book> _savedBook = List();

  BookServices._internal() {
    Book b = Book(id: "5e8b51c22452b455e54ffc1822", volume: 1, title: "Le guide du voyageur 2121", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    Book b1 = Book(id: "5e8b51c22452b455e54ffc1811", volume: 1, title: "Le guide du voyageur 33333", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    Book b2 = Book(id: "5e8b51c22452b455e54ffc1844", volume: 1, title: "Le guide du voyageur 989898", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    Book b3 = Book(id: "5e8b51c22452b455e54ffc182212", volume: 1, title: "Le guide du voyageur 7767668", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    Book b4 = Book(id: "5e8b51c22452b455e54ffc181144", volume: 1, title: "Le guide du voyageur 11111111", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    Book b5 = Book(id: "5e8b51c22452b455e54ffc184411", volume: 1, title: "Le guide du voyageur 000000", author: "Douglas Adams", imageUrl: "https://i.ibb.co/JytmRjz/Le-guide-du-voyageur-galactique.jpg");
    _allMockBook = [b, b1, b2, b3, b4, b5];
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

  Future<List<Book>> getAllBooks() async {
    await Future.delayed(const Duration(seconds: 2));
    return _allMockBook;
  }

  Future<List<Book>> getSavedBooks() async {
    return _savedBook;
  }

  Future markBookAsFavored(Book book) async {
    if(_savedBook.contains(book)) {
      return;
    }
    _savedBook.add(book);
  }

  Future removeBookAsFavored(Book book) async {
    return _savedBook.remove(book);
  }

  bool isMarkedAsFavored(Book book) {
    return _savedBook.contains(book);
  }
}