import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/functions/save_books.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEnitie>> fetchFeaturedBooks();
  Future<List<BookEnitie>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEnitie>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEnitie> books = getBookList(data);
    savedBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEnitie>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming&Sorting=newest');
    List<BookEnitie> books = getBookList(data);
    savedBooksData(books, kNewestBox);
    return books;
  }
}

List<BookEnitie> getBookList(Map<String, dynamic> data) {
  List<BookEnitie> books = [];
  for (var bookMap in data["items"]) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}