import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.index,
    required this.books,
  });
  final int index;
  final List<BookEnitie> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .4,
          child: CustomBookImageItem(
            image: books[index].image!,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          textAlign: TextAlign.center,
          books[index].title,
          style: Styles.textSyle30.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            books[index].authorName ?? 'No Author Name',
            style: Styles.textSyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BookRatingItem(
          index: index,
          books: books,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksDetailsButtonsAction(
          books: books,
          index: index,
        ),
      ],
    );
  }
}
