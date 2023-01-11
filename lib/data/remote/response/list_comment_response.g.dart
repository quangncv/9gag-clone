// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommentResponse _$ListCommentResponseFromJson(Map<String, dynamic> json) =>
    ListCommentResponse(
      json['total'] as int,
      (json['comments'] as List<dynamic>)
          .map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next'] as String?,
    );

Map<String, dynamic> _$ListCommentResponseToJson(
        ListCommentResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'comments': instance.comments,
      'next': instance.next,
    };
