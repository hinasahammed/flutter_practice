import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language {
	String? language;
	String? name;

	Language({this.language, this.name});

	factory Language.fromJson(Map<String, dynamic> json) {
		return _$LanguageFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
