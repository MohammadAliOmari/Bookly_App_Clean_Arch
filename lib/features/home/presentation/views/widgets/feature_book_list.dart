import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureBookList extends StatelessWidget {
  const FeatureBookList({super.key, required this.books});
  final List<BookEnitie> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push('/BookDetailsView/$index', extra: books);
              },
              child: CustomBookImageItem(
                image: books[index].image ?? '',
              ),
            ),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
