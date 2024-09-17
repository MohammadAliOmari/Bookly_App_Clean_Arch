import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.featuredBooksUseCase, this.fetchNewestBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  List<BookEnitie> fbooks = [];
  List<BookEnitie> nbooks = [];
  Future<void> fetcheBooks() async {
    emit(FeaturedBooksLoading());
    Either<Failure, List<BookEnitie>> result =
        await featuredBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FeaturedBooksError(failure.message));
      },
      (books) {
        fbooks = books;
        emit(FeaturedBooksSuccess());
      },
    );
  }

  Future<void> fetcheNewestBooks() async {
    emit(NewestBooksLoading());
    Either<Failure, List<BookEnitie>> result =
        await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(NewestBooksError(failure.message));
      },
      (books) {
        nbooks = books;
        emit(NewestBooksSuccess());
      },
    );
  }
}
