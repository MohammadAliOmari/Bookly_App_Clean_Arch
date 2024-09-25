import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListItem extends StatelessWidget {
  const BestSellerListItem(
      {super.key, required this.books, required this.index});
  final List<BookEnitie> books;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await GoRouter.of(context).push('/BookDetailsView/$index',
            extra: books
                .map(
                  (e) => e.toJson(),
                )
                .toList());
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.6 / 4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                        fit: BoxFit.fill, imageUrl: books[index].image ?? ''))),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      books[index].title,
                      style:
                          Styles.textSyle20.copyWith(fontFamily: kGTSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    books[index].authorName ?? 'No Author Name',
                    style: Styles.textSyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        books[index].price != null
                            ? '${books[index].price} \$'
                            : 'Free',
                        style: Styles.textSyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      BookRatingItem(
                        index: index,
                        books: books,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
