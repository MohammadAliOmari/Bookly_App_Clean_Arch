import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_list.dart';
import 'package:flutter/material.dart';

class BookDetailsListSection extends StatelessWidget {
  const BookDetailsListSection({super.key, required this.books});
  final List<dynamic> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'You can also like',
            style: Styles.textSyle16.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BooksDetailsList(
          books: books,
        ),
      ],
    );
  }
}
