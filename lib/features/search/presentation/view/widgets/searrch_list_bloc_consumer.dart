import 'package:bookly/features/search/presentation/manager/search_cubit.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return SerchResultList(
            books: context.read<SearchCubit>().sbooks,
          );
        } else if (state is SearchFaliureState) {
          return Text(state.errormassege);
        } else if (state is SearchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Search For Books 🔎'));
        }
      },
    );
  }
}
