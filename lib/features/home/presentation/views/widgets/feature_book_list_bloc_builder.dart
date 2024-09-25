import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/shimmer_loading.dart';
import 'package:bookly/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

class FeattureBookListBlocBuilder extends StatelessWidget {
  const FeattureBookListBlocBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is FeaturedBooksError) {
          Fluttertoast.showToast(
            msg: state.errorM,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 5,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
        if (state is FeaturedBooksPaginatioError) {
          Fluttertoast.showToast(
            msg: state.errMsg,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 5,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is NewestBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginatioError) {
          return FeatureBookList(
            books: context.read<HomeCubit>().fbooks,
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
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ShimmerLoading(
                          child: Container(
                            color: Colors.grey,
                          ),
                        )),
                  ),
                );
              },
              itemCount: 10,
            ),
          );
        }
      },
    );
  }
}
