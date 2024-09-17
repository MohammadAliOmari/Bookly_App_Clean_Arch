// import 'package:bookly/core/errors/failure.dart';
// import 'package:bookly/features/home/domain/entities/book_entity.dart';
// import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// part 'newest_books_state.dart';

// class NewestBooksCubit extends Cubit<NewestBooksState> {
//   NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
//   final FetchNewestBooksUseCase fetchNewestBooksUseCase;

//   Future<void> fetcheNewestBooks() async {
//     emit(NewestBooksLoading());
//     Either<Failure, List<BookEnitie>> result =
//         await fetchNewestBooksUseCase.call();
//     result.fold(
//       (failure) {
//         emit(NewestBooksFailure(failure.message));
//       },
//       (books) {
//         emit(NewestBooksSuccess(books));
//       },
//     );
//   }
// }
