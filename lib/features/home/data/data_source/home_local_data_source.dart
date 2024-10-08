import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEnitie> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEnitie> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEnitie> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEnitie>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEnitie> fetchNewestBooks() {
    var box = Hive.box<BookEnitie>(kNewestBox);
    return box.values.toList();
  }
}
