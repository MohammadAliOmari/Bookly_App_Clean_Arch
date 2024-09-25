import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEnitie>, int> {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEnitie>>> call([int param = 0]) async {
    return await homeRepository.fetchFeaturedBooks(
      pageNumber: param,
    );
  }
}
