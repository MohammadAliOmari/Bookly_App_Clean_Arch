import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeatureBookList(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 50,
                  bottom: 20,
                ),
                child: Text(
                  'Best Seller',
                  style: Styles.textSyle18,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerList(),
        )
      ],
    );
  }
}
