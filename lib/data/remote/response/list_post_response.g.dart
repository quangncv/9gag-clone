// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPostResponse _$ListPostResponseFromJson(Map<String, dynamic> json) =>
    ListPostResponse(
      json['nextCursor'] as String?,
      json['feedId'] as String?,
      (json['posts'] as List<dynamic>)
          .map((e) => PostResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..tags = (json['tags'] as List<dynamic>?)
        ?.map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ListPostResponseToJson(ListPostResponse instance) =>
    <String, dynamic>{
      'nextCursor': instance.nextCursor,
      'feedId': instance.feedId,
      'posts': instance.posts,
      'tags': instance.tags,
    };
