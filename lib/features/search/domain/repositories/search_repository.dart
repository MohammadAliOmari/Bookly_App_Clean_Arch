import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Bookentite>>> fetchSearchResult(String endpoint);
}
