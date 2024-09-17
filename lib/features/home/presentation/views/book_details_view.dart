import 'package:bookly/core/utils/dependency_injection/locater.dart';
import 'package:bookly/features/home/data/repositories/home_repositories_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({
    super.key,
    required this.index,
    required this.books,
  });
  final int index;
  final List<BookEnitie> books;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeCubit(
          FetchFeaturedBooksUseCase(
            getIt.get<HomeRepositoriesImpl>(),
          ),
          FetchNewestBooksUseCase(
            getIt.get<HomeRepositoriesImpl>(),
          ),
        )..fetcheNewestBooks();
      },
      child: BookDetailsBlocConsumer(books: books, index: index),
    );
  }
}
