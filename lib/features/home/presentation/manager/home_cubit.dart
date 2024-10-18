import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.featuredBooksUseCase, this.fetchNewestBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  // List<BookEnitie> featureBooks = [];
  // List<BookEnitie> newestBooks = [];
  Future<void> fetcheFeatureBooks({int pageNamber = 0}) async {
    if (pageNamber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    Either<Failure, List<BookEnitie>> result =
        await featuredBooksUseCase.call(pageNamber);
    result.fold(
      (failure) {
        if (pageNamber == 0) {
          emit(FeaturedBooksError(failure.message));
        } else {
          emit(FeaturedBooksPaginatioError(failure.message));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
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
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
