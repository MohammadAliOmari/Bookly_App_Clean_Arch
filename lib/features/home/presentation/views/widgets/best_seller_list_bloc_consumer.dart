import 'package:bookly/core/widgets/snack_bar.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListBlocConsumer extends StatefulWidget {
  const BestSellerListBlocConsumer({
    super.key,
  });

  @override
  State<BestSellerListBlocConsumer> createState() =>
      _BestSellerListBlocConsumerState();
}

class _BestSellerListBlocConsumerState
    extends State<BestSellerListBlocConsumer> {
  List<BookEnitie> newestbooks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          newestbooks.addAll(state.books);
        }
        if (state is NewestBooksError) {
          snackBar(
            msg: state.errorM,
            color: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is NewestBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginatioError) {
          return BestSellerList(books: newestbooks);
        } else if (state is FeaturedBooksError || state is NewestBooksError) {
          return Center(
            child: Text(state is FeaturedBooksError
                ? state.errorM
                : state is NewestBooksError
                    ? state.errorM
                    : 'Thers is error '),
          );
        } else {
          return const BestSellerListShimmerLoading();
        }
      },
    );
  }
}
