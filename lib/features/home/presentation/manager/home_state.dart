part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class FeaturedBooksInitial extends HomeState {}

final class FeaturedBooksLoading extends HomeState {}

final class FeaturedBooksPaginationLoading extends HomeState {}

final class FeaturedBooksPaginatioError extends HomeState {
  final String errMsg;

  FeaturedBooksPaginatioError(this.errMsg);
}

final class FeaturedBooksError extends HomeState {
  final String errorM;

  FeaturedBooksError(this.errorM);
}

final class FeaturedBooksSuccess extends HomeState {
  final List<BookEnitie> books;

  FeaturedBooksSuccess(this.books);
}

final class NewestBooksLoading extends HomeState {}

final class NewestBooksError extends HomeState {
  final String errorM;

  NewestBooksError(this.errorM);
}

final class NewestBooksSuccess extends HomeState {
  final List<BookEnitie> books;

  NewestBooksSuccess(this.books);
}
