import 'package:bookly/features/search/domain/entites/book_entity.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SerchResultList extends StatelessWidget {
  const SerchResultList({super.key, required this.books});
  final List<Bookentite> books;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: GestureDetector(
              onTap: () async {
                await GoRouter.of(context).push(
                  '/SearchBookDetailsView/$index',
                  extra: books,
                );
              },
              child: SearchListItem(
                books: books,
                index: index,
              ),
            ),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
