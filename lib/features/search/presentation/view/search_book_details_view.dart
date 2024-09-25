import 'package:bookly/core/utils/dependency_injection/locater.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_bloc_consumer.dart';
import 'package:bookly/features/search/data/repositories/search_repository_impl.dart';
import 'package:bookly/features/search/domain/use_cases/fetch_search_result_use_case.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookDetailsView extends StatelessWidget {
  const SearchBookDetailsView({
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
        return SearchCubit(
          FetchSearchResultUseCase(getIt.get<SearchRepositoryImpl>()),
        );
      },
      child: BookDetailsBlocConsumer(books: books, index: index),
    );
  }
}
