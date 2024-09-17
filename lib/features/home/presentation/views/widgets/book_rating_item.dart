import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatingItem extends StatelessWidget {
  const BookRatingItem(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.books,
      required this.index});
  final MainAxisAlignment mainAxisAlignment;
  final List<BookEnitie> books;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          size: 15,
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          books[index].rating.toString(),
          style: Styles.textSyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            ('(${books[index].countRating.toString()})'),
            style: Styles.textSyle14,
          ),
        ),
      ],
    );
  }
}
