import 'package:bookly/features/home/domain/entities/book_entitie.dart';

abstract class HomeRepository {
  Future<List<BookEnitie>> fetchFeaturedBooks();
  Future<List<BookEnitie>> fetchNewestBooks();
}
