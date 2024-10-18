import 'package:bookly/core/widgets/snack_bar.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_book_list_loaading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeattureBookListBlocBuilder extends StatefulWidget {
  const FeattureBookListBlocBuilder({
    super.key,
  });

  @override
  State<FeattureBookListBlocBuilder> createState() =>
      _FeattureBookListBlocBuilderState();
}

class _FeattureBookListBlocBuilderState
    extends State<FeattureBookListBlocBuilder> {
  List<BookEnitie> featuredbooks = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          featuredbooks.addAll(state.books);
        }

        if (state is FeaturedBooksError) {
          snackBar(
              msg: state.errorM, color: Colors.red, textColor: Colors.white);
        }
        if (state is FeaturedBooksPaginatioError) {
          snackBar(
              msg: state.errMsg, color: Colors.red, textColor: Colors.white);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is NewestBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginatioError) {
          return FeatureBookList(
            books: featuredbooks,
          );
        } else if (state is FeaturedBooksError || state is NewestBooksError) {
          return Center(
            child: Text(state is FeaturedBooksError
                ? state.errorM
                : state is NewestBooksError
                    ? state.errorM
                    : 'Thers is error '),
          );
        } else {
          return const FeaturedBooksListLoading();
        }
      },
    );
  }
}
