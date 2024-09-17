import 'package:bookly/features/home/domain/entities/book_entity.dart';

import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/view/search_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kBookDetailsView = '/BookDetailsView/:index';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) {
        final List<BookEnitie> books = state.extra as List<BookEnitie>;
        final int index = int.parse(state.pathParameters['index']!);
        return BookDetailsView(
          books: books,
          index: index,
        );
      },
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
