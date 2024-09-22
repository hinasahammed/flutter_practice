// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModel {
  final String title;
  final String desc;
  final String date;
  final String loc;

  EventModel({
    required this.title,
    required this.desc,
    required this.date,
    required this.loc,
  });

  EventModel copyWith({
    String? title,
    String? desc,
    String? date,
    String? loc,
  }) {
    return EventModel(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      loc: loc ?? this.loc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'desc': desc,
      'date': date,
      'loc': loc,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'] as String,
      desc: map['desc'] as String,
      date: map['date'] as String,
      loc: map['loc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(title: $title, desc: $desc, date: $date, loc: $loc)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.desc == desc &&
      other.date == date &&
      other.loc == loc;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      desc.hashCode ^
      date.hashCode ^
      loc.hashCode;
  }
}
