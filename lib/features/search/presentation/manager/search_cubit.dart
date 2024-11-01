import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/domain/entites/book_entity.dart';
import 'package:bookly/features/search/domain/use_cases/fetch_search_result_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.fetchSearchResultUseCase,
  ) : super(SearchInitial());
  final FetchSearchResultUseCase fetchSearchResultUseCase;
  TextEditingController searchController = TextEditingController();
  List<Bookentite> sbooks = [];
  Future<void> fetchbooks() async {
    sbooks = [];
    emit(SearchLoadingState());
    var result = await fetchSearchResultUseCase.call(searchController.text);
    result.fold(
      (failure) {
        emit(SearchFaliureState(failure.message));
      },
      (books) {
        sbooks = books;
        emit(SearchSuccessState());
      },
    );
  }
}
