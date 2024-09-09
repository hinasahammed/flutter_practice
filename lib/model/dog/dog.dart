import 'package:json_annotation/json_annotation.dart';

part 'dog.g.dart';

@JsonSerializable()
class Dog {
	String? id;
	String? url;
	int? width;
	int? height;

	Dog({this.id, this.url, this.width, this.height});

	factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);

	Map<String, dynamic> toJson() => _$DogToJson(this);
}
