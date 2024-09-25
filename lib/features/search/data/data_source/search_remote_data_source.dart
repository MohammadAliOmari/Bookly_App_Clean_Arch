import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEnitie>> fetchSearchResult(String endpoint);
}

class SearcHremoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiServices apiServices;

  SearcHremoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEnitie>> fetchSearchResult(String endpoint) async {
    var data = await apiServices.get(
        endPoint: 'Filtering=free-ebooks&q=$endpoint&Sorting=toprating');
    List<BookEnitie> books = getBookList(data);
    return books;
  }

  List<BookEnitie> getBookList(Map<String, dynamic> data) {
    List<BookEnitie> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
