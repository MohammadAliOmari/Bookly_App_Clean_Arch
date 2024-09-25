import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoriesImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoriesImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEnitie>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEnitie> cachedBooks = [];
      List<BookEnitie> newBooks = [];

      // Fetch the cached books only when pageNumber is 0 (first fetch)
      if (pageNumber == 0) {
        cachedBooks = homeLocalDataSource.fetchFeaturedBooks();
        if (cachedBooks.isNotEmpty) {
          return right(cachedBooks);
        }
      }

      // Fetch the new books from the remote data source
      newBooks =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);

      // If cached books exist, combine cached and new books
      if (cachedBooks.isNotEmpty) {
        // Combine cached and new books without duplicates
        newBooks = [...cachedBooks, ...newBooks];
      }

      return right(newBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEnitie>>> fetchNewestBooks() async {
    try {
      List<BookEnitie> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
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
