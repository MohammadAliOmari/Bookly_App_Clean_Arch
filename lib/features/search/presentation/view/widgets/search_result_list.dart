import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_item.dart';
import 'package:flutter/material.dart';

class SerchResultList extends StatelessWidget {
  const SerchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.zero,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: BestSellerListItem(
              books: [],
              index: 1,
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
