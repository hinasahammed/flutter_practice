import 'package:json_annotation/json_annotation.dart';

part 'matched_substring.g.dart';

@JsonSerializable()
class MatchedSubstring {
	int? length;
	int? offset;

	MatchedSubstring({this.length, this.offset});

	factory MatchedSubstring.fromJson(Map<String, dynamic> json) {
		return _$MatchedSubstringFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MatchedSubstringToJson(this);
}
