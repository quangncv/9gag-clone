// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      json['commentId'] as String?,
      json['level'] as int?,
      json['permalink'] as String?,
      json['text'] as String?,
      json['threadId'] as String?,
      json['timestamp'] as int?,
      json['type'] as String?,
      json['mediaText'] as String?,
      json['likeCount'] as int?,
      json['dislikeCount'] as int?,
      json['childrenTotal'] as int?,
      json['childrenUrl'] as String?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      (json['media'] as List<dynamic>?)
          ?.map((e) => MediaResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..mentionMapping = json['mentionMapping'];

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'level': instance.level,
      'mentionMapping': instance.mentionMapping,
      'permalink': instance.permalink,
      'text': instance.text,
      'threadId': instance.threadId,
      'timestamp': instance.timestamp,
      'type': instance.type,
      'mediaText': instance.mediaText,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'childrenTotal': instance.childrenTotal,
      'childrenUrl': instance.childrenUrl,
      'user': instance.user,
      'media': instance.media,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['displayName'] as String?,
      json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
    };

MediaResponse _$MediaResponseFromJson(Map<String, dynamic> json) =>
    MediaResponse(
      json['imageMetaByType'] == null
          ? null
          : ImageMetaByTypeResponse.fromJson(
              json['imageMetaByType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaResponseToJson(MediaResponse instance) =>
    <String, dynamic>{
      'imageMetaByType': instance.imageMetaByType,
    };

ImageMetaByTypeResponse _$ImageMetaByTypeResponseFromJson(
        Map<String, dynamic> json) =>
    ImageMetaByTypeResponse(
      json['type'] as String,
      json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      json['imageXLarge'] == null
          ? null
          : ImageXLargeResponse.fromJson(
              json['imageXLarge'] as Map<String, dynamic>),
      json['animated'] == null
          ? null
          : AnimatedResponse.fromJson(json['animated'] as Map<String, dynamic>),
      json['video'] == null
          ? null
          : VideoResponse.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageMetaByTypeResponseToJson(
        ImageMetaByTypeResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image': instance.image,
      'imageXLarge': instance.imageXLarge,
      'animated': instance.animated,
      'video': instance.video,
    };

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      json['width'] as int?,
      json['height'] as int?,
      json['url'] as String?,
      json['webpUrl'] as String?,
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'webpUrl': instance.webpUrl,
    };

ImageXLargeResponse _$ImageXLargeResponseFromJson(Map<String, dynamic> json) =>
    ImageXLargeResponse(
      json['width'] as int?,
      json['height'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ImageXLargeResponseToJson(
        ImageXLargeResponse instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

AnimatedResponse _$AnimatedResponseFromJson(Map<String, dynamic> json) =>
    AnimatedResponse(
      json['width'] as int?,
      json['height'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$AnimatedResponseToJson(AnimatedResponse instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      json['width'] as int?,
      json['height'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
