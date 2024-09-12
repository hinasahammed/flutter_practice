import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
	String? name;
	String? region;
	String? country;
	double? lat;
	double? lon;
	@JsonKey(name: 'tz_id') 
	String? tzId;
	@JsonKey(name: 'localtime_epoch') 
	int? localtimeEpoch;
	String? localtime;

	Location({
		this.name, 
		this.region, 
		this.country, 
		this.lat, 
		this.lon, 
		this.tzId, 
		this.localtimeEpoch, 
		this.localtime, 
	});

	factory Location.fromJson(Map<String, dynamic> json) {
		return _$LocationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LocationToJson(this);
}
