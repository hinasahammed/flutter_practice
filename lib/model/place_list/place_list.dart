import 'package:json_annotation/json_annotation.dart';

import 'matched_substring.dart';
import 'structured_formatting.dart';
import 'term.dart';

part 'place_list.g.dart';

@JsonSerializable()
class PlaceList {
	String? description;
	@JsonKey(name: 'matched_substrings') 
	List<MatchedSubstring>? matchedSubstrings;
	@JsonKey(name: 'place_id') 
	String? placeId;
	String? reference;
	@JsonKey(name: 'structured_formatting') 
	StructuredFormatting? structuredFormatting;
	List<Term>? terms;
	List<String>? types;

	PlaceList({
		this.description, 
		this.matchedSubstrings, 
		this.placeId, 
		this.reference, 
		this.structuredFormatting, 
		this.terms, 
		this.types, 
	});

	factory PlaceList.fromJson(Map<String, dynamic> json) {
		return _$PlaceListFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PlaceListToJson(this);
}
