import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_list_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:flutter/material.dart';

class SearchBookDeatilsViewBody extends StatelessWidget {
  const SearchBookDeatilsViewBody({
    super.key,
    required this.index,
    required this.books,
  });
  final int index;
  final List<BookEnitie> books;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              const BookDetailsCustomAppBar(),
              BookDetailsSection(
                index: index,
                books: books,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              BookDetailsListSection(
                books: books,
              ),
            ],
          ),
        )
      ],
    );
  }
}
