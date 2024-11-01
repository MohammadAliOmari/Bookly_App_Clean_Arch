import 'package:bookly/features/home/presentation/manager/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsBlocConsumer extends StatelessWidget {
  const BookDetailsBlocConsumer({
    super.key,
    required this.books,
    required this.index,
  });

  final List<dynamic> books;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: BookDetailsViewBody(
            books: books,
            index: index,
          ),
        );
      },
    );
  }
}
