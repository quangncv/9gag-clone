// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsResponse _$TagsResponseFromJson(Map<String, dynamic> json) => TagsResponse(
      (json['popular'] as List<dynamic>)
          .map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['other'] as List<dynamic>)
          .map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['trending'] as List<dynamic>)
          .map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TagsResponseToJson(TagsResponse instance) =>
    <String, dynamic>{
      'popular': instance.popular,
      'other': instance.other,
      'trending': instance.trending,
    };
