import 'package:bookly/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_list_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              BookDetailsCustomAppBar(),
              BookDetailsSection(),
              Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              BookDetailsListSection(),
            ],
          ),
        )
      ],
    );
  }
}
