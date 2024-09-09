import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'articles_model.g.dart';

@JsonSerializable()
class ArticlesModel {
	String? status;
	int? totalResults;
	List<Article>? articles;

	ArticlesModel({this.status, this.totalResults, this.articles});

	factory ArticlesModel.fromJson(Map<String, dynamic> json) {
		return _$ArticlesModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ArticlesModelToJson(this);
}
