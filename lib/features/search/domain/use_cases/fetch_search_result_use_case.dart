import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/domain/entites/book_entity.dart';
import 'package:bookly/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class FetchSearchResultUseCase extends UseCase<List<Bookentite>, String> {
  final SearchRepository searchRepository;

  FetchSearchResultUseCase(this.searchRepository);
  @override
  Future<Either<Failure, List<Bookentite>>> call([String? param]) async {
    return await searchRepository.fetchSearchResult(param!);
  }
}
