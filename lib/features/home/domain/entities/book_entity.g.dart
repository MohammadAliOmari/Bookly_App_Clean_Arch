// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEnitieAdapter extends TypeAdapter<BookEnitie> {
  @override
  final int typeId = 0;

  @override
  BookEnitie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEnitie(
      link: fields[7] as String,
      bookid: fields[0] as String,
      image: fields[1] as String?,
      title: fields[2] as String,
      authorName: fields[3] as String?,
      price: fields[4] as num?,
      rating: fields[5] as num?,
      countRating: fields[6] as num,
    );
  }

  @override
  void write(BinaryWriter writer, BookEnitie obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.bookid)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.authorName)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.countRating)
      ..writeByte(7)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEnitieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
