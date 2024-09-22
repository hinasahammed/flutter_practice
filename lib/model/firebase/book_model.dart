// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookModel {
  final String title;
  final String author;
  final String genre;
  final String isbn;

  BookModel({
    required this.title,
    required this.author,
    required this.genre,
    required this.isbn,
  });

  BookModel copyWith({
    String? title,
    String? author,
    String? genre,
    String? isbn,
  }) {
    return BookModel(
      title: title ?? this.title,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      isbn: isbn ?? this.isbn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'genre': genre,
      'isbn': isbn,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] as String,
      author: map['author'] as String,
      genre: map['genre'] as String,
      isbn: map['isbn'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(title: $title, author: $author, genre: $genre, isbn: $isbn)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.author == author &&
      other.genre == genre &&
      other.isbn == isbn;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      genre.hashCode ^
      isbn.hashCode;
  }
}
