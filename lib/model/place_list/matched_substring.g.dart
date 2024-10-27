// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_substring.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchedSubstring _$MatchedSubstringFromJson(Map<String, dynamic> json) =>
    MatchedSubstring(
      length: (json['length'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MatchedSubstringToJson(MatchedSubstring instance) =>
    <String, dynamic>{
      'length': instance.length,
      'offset': instance.offset,
    };
