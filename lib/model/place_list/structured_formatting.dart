import 'package:json_annotation/json_annotation.dart';

import 'main_text_matched_substring.dart';

part 'structured_formatting.g.dart';

@JsonSerializable()
class StructuredFormatting {
	@JsonKey(name: 'main_text') 
	String? mainText;
	@JsonKey(name: 'main_text_matched_substrings') 
	List<MainTextMatchedSubstring>? mainTextMatchedSubstrings;
	@JsonKey(name: 'secondary_text') 
	String? secondaryText;

	StructuredFormatting({
		this.mainText, 
		this.mainTextMatchedSubstrings, 
		this.secondaryText, 
	});

	factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
		return _$StructuredFormattingFromJson(json);
	}

	Map<String, dynamic> toJson() => _$StructuredFormattingToJson(this);
}
