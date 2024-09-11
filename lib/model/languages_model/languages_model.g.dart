// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguagesModel _$LanguagesModelFromJson(Map<String, dynamic> json) =>
    LanguagesModel(
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguagesModelToJson(LanguagesModel instance) =>
    <String, dynamic>{
      'languages': instance.languages,
    };
