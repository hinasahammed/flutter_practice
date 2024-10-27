import 'package:json_annotation/json_annotation.dart';

part 'term.g.dart';

@JsonSerializable()
class Term {
	int? offset;
	String? value;

	Term({this.offset, this.value});

	factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

	Map<String, dynamic> toJson() => _$TermToJson(this);
}
