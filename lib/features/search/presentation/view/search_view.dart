import 'package:bookly/core/utils/dependency_injection/locater.dart';
import 'package:bookly/features/search/data/repositories/search_repository_impl.dart';
import 'package:bookly/features/search/domain/use_cases/fetch_search_result_use_case.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        FetchSearchResultUseCase(getIt.get<SearchRepositoryImpl>()),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
