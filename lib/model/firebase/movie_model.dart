// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MovieModel {
  final String title;
  final String director;
  final String release;
  final String rating;

  MovieModel({
    required this.title,
    required this.director,
    required this.release,
    required this.rating,
  });

  MovieModel copyWith({
    String? title,
    String? director,
    String? release,
    String? rating,
  }) {
    return MovieModel(
      title: title ?? this.title,
      director: director ?? this.director,
      release: release ?? this.release,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'director': director,
      'release': release,
      'rating': rating,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'] as String,
      director: map['director'] as String,
      release: map['release'] as String,
      rating: map['rating'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(title: $title, director: $director, release: $release, rating: $rating)';
  }

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.director == director &&
        other.release == release &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        director.hashCode ^
        release.hashCode ^
        rating.hashCode;
  }
}
