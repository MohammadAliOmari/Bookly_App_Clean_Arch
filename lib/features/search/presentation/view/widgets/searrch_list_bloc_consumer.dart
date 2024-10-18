import 'package:bookly/core/widgets/snack_bar.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_list_Loading.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListBlocConsumer extends StatelessWidget {
  const SearchListBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchFaliureState) {
          return snackBar(
              msg: state.errormassege,
              color: Colors.red,
              textColor: Colors.white);
        }
      },
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return SerchResultList(
            books: context.read<SearchCubit>().sbooks,
          );
        } else if (state is SearchFaliureState) {
          return Expanded(
            child: Center(
                child: Opacity(
              opacity: 0.6,
              child: Text(
                textAlign: TextAlign.center,
                state.errormassege,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            )),
          );
        } else if (state is SearchLoadingState) {
          return const SearchListLoading();
        } else {
          return const Expanded(
            child: Center(
                child: Opacity(
              opacity: 0.6,
              child: Text(
                textAlign: TextAlign.center,
                'Search For Books Here 🔎',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            )),
          );
        }
      },
    );
  }
}
