import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEnitie {
  @HiveField(0)
  final String bookid;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final num countRating;

  BookEnitie({
    required this.bookid,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.countRating,
  });
  Map<String, dynamic> toJson() {
    return {
      'bookid': bookid,
      'title': title,
      'authorName': authorName,
      'image': image,
      'price': price,
      'rating': rating,
      'countRating': countRating,
    };
  }

  factory BookEnitie.fromJson(Map<String, dynamic> json) {
    return BookEnitie(
      bookid: json['bookid'],
      title: json['title'],
      authorName: json['authorName'],
      image: json['image'],
      price: json['price'],
      rating: json['rating'],
      countRating: json['countRating'],
    );
  }
}
