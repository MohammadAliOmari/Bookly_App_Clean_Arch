part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchFaliureState extends SearchState {
  final String errormassege;

  SearchFaliureState(this.errormassege);
}

final class SearchSuccessState extends SearchState {}
