import 'package:json_annotation/json_annotation.dart';

import 'language.dart';

part 'languages_model.g.dart';

@JsonSerializable()
class LanguagesModel {
	List<Language>? languages;

	LanguagesModel({this.languages});

	factory LanguagesModel.fromJson(Map<String, dynamic> json) {
		return _$LanguagesModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LanguagesModelToJson(this);
}
