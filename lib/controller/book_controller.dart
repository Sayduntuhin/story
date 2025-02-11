import 'package:get/get.dart';

class Book {
  final String name;
  double progress;

  Book({
    required this.name,
    this.progress = 1,
  });
}

class BookController extends GetxController {
  var books = <Book>[].obs;

  void addBook(String name) {
    books.add(Book(name: name));
  }
}
