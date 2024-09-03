import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';

class BooksDetailsList extends StatelessWidget {
  const BooksDetailsList({super.key});

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
            return const Padding(
              padding: EdgeInsets.only(right: 7),
              child: CustomBookImageItem(),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
