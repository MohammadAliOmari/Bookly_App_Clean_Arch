import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_book_deatils_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookDetailsBlocConsumer extends StatelessWidget {
  const SearchBookDetailsBlocConsumer({
    super.key,
    required this.books,
    required this.index,
  });

  final List<BookEnitie> books;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SearchBookDeatilsViewBody(
            books: books,
            index: index,
          ),
        );
      },
    );
  }
}
