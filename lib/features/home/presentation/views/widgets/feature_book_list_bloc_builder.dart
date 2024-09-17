import 'package:bookly/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      },
      builder: (context, state) {
        return context.read<HomeCubit>().fbooks.isNotEmpty
            ? FeatureBookList(
                books: context.read<HomeCubit>().fbooks,
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
