// import 'package:bookly/core/errors/failure.dart';
// import 'package:bookly/features/home/domain/entities/book_entity.dart';
// import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
// import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// part 'featured_books_state.dart';

// class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
//   FeaturedBooksCubit(
//     this.featuredBooksUseCase,
//   ) : super(HomeInital());
//   final FetchFeaturedBooksUseCase featuredBooksUseCase;
//   Future<void> fetcheFetauredBooks() async {
//     emit(FeaturedBooksLoading());
//     Either<Failure, List<BookEnitie>> result =
//         await featuredBooksUseCase.call();
//     result.fold(
//       (failure) {
//         emit(FeaturedBooksFailure(failure.message));
//       },
//       (books) {
//         emit(FeaturedBooksSuccess(books));
//       },
//     );
//   }
// }
