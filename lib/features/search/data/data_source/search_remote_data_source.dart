import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/data/model/search_model.dart';
import 'package:bookly/features/search/domain/entites/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<Bookentite>> fetchSearchResult(String endpoint);
}

class SearcHremoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiServices apiServices;

  SearcHremoteDataSourceImpl(this.apiServices);
  @override
  Future<List<Bookentite>> fetchSearchResult(String endpoint) async {
    var data = await apiServices.get(endPoint: 'q=$endpoint');
    List<Bookentite> books = getBookList(data);
    return books;
  }

  List<Bookentite> getBookList(Map<String, dynamic> data) {
    List<Bookentite> books = [];
    for (var bookMap in data["items"]) {
      books.add(SearchBookModel.fromJson(bookMap));
    }
    return books;
  }
}
