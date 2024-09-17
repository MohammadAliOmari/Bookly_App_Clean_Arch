import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void savedBooksData(List<BookEnitie> books, String boxName) {
  var box = Hive.box<BookEnitie>(boxName);
  box.addAll(books);
}
