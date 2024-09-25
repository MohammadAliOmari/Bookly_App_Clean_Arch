import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource searchremoteDataSource;

  SearchRepositoryImpl(this.searchremoteDataSource);
  @override
  Future<Either<Failure, List<BookEnitie>>> fetchSearchResult(
      String endpoint) async {
    try {
      List<BookEnitie> books;
      books = await searchremoteDataSource.fetchSearchResult(endpoint);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
