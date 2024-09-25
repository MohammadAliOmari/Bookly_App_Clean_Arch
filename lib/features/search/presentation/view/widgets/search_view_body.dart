import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit.dart';
import 'package:bookly/features/search/presentation/view/widgets/searrch_list_bloc_consumer.dart';
import 'package:bookly/features/search/presentation/view/widgets/text_field_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late SearchCubit searchCubit;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtain the SearchCubit instance when dependencies change
    searchCubit = context.read<SearchCubit>();
  }

  @override
  void dispose() {
    searchCubit.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFieldSearchView(
            textEditingController: context.read<SearchCubit>().searchController,
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            'Search Result',
            style: Styles.textSyle18,
          ),
          const SizedBox(
            height: 22,
          ),
          const SearchListBlocConsumer()
        ],
      ),
    );
  }
}
