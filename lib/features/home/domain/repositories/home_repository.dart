import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BookEnitie>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEnitie>>> fetchNewestBooks();
}
