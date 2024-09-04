import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_list.dart';
import 'package:bookly/features/search/presentation/view/widgets/text_field_search_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          TextFieldSearchView(),
          SizedBox(
            height: 22,
          ),
          Text(
            'Search Result',
            style: Styles.textSyle18,
          ),
          SizedBox(
            height: 22,
          ),
          SerchResultList(),
        ],
      ),
    );
  }
}
