import 'package:bookly/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BestSellerListBlocConsumer extends StatelessWidget {
  const BestSellerListBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is NewestBooksError) {
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
        return context.read<HomeCubit>().nbooks.isNotEmpty
            ? BestSellerList(books: context.read<HomeCubit>().nbooks)
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
