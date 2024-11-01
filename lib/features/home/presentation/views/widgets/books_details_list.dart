import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksDetailsList extends StatelessWidget {
  const BooksDetailsList({
    super.key,
    required this.books,
  });
  final List<dynamic> books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, bottom: 40),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .16,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 7),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push('/BookDetailsView/$index', extra: books);
                },
                child: CustomBookImageItem(
                  image: books[index].image ??
                      'https://images.unsplash.com/photo-1532012197267-da84d127e765?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
            );
          },
          itemCount: books.length,
        ),
      ),
    );
  }
}
