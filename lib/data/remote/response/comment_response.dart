import 'package:json_annotation/json_annotation.dart';

part 'comment_response.g.dart';

@JsonSerializable()
class CommentResponse {
  @JsonKey(name: 'commentId')
  String? commentId;
  @JsonKey(name: 'level')
  int? level;
  @JsonKey(name: 'mentionMapping')
  Object? mentionMapping;
  @JsonKey(name: 'permalink')
  String? permalink;
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'threadId')
  String? threadId;
  @JsonKey(name: 'timestamp')
  int? timestamp;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'mediaText')
  String? mediaText;
  @JsonKey(name: 'likeCount')
  int? likeCount;
  @JsonKey(name: 'dislikeCount')
  int? dislikeCount;
  @JsonKey(name: 'childrenTotal')
  int? childrenTotal;
  @JsonKey(name: 'childrenUrl')
  String? childrenUrl;
  @JsonKey(name: 'user')
  UserResponse? user;
  @JsonKey(name: 'media')
  List<MediaResponse>? media;

  CommentResponse(
      this.commentId,
      this.level,
      this.permalink,
      this.text,
      this.threadId,
      this.timestamp,
      this.type,
      this.mediaText,
      this.likeCount,
      this.dislikeCount,
      this.childrenTotal,
      this.childrenUrl,
      this.user,
      this.media);

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$CommentResponseToJson(this);

  String? getMediaType() {
    return media?.first.imageMetaByType?.type;
  }

  bool isGif() {
    return getMedia()?.split('.').last == 'gif';
  }

  String? getMedia() {
    if (media?.first.imageMetaByType?.type == 'STATIC') {
      return media?.first.imageMetaByType?.image?.webpUrl;
    }

    return media?.first.imageMetaByType?.animated?.url;
  }
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'displayName')
  String? displayName;
  @JsonKey(name: 'avatarUrl')
  String? avatarUrl;

  UserResponse(this.displayName, this.avatarUrl);

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$UserResponseToJson(this);
}

@JsonSerializable()
class MediaResponse {
  @JsonKey(name: 'imageMetaByType')
  ImageMetaByTypeResponse? imageMetaByType;

  MediaResponse(this.imageMetaByType);

  factory MediaResponse.fromJson(Map<String, dynamic> json) => _$MediaResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$MediaResponseToJson(this);
}

@JsonSerializable()
class ImageMetaByTypeResponse {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'image')
  ImageResponse? image;
  @JsonKey(name: 'imageXLarge')
  ImageXLargeResponse? imageXLarge;
  @JsonKey(name: 'animated')
  AnimatedResponse? animated;
  @JsonKey(name: 'video')
  VideoResponse? video;


  ImageMetaByTypeResponse(
      this.type, this.image, this.imageXLarge, this.animated, this.video);

  factory ImageMetaByTypeResponse.fromJson(Map<String, dynamic> json) => _$ImageMetaByTypeResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$ImageMetaByTypeResponseToJson(this);
}

@JsonSerializable()
class ImageResponse {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'webpUrl')
  String? webpUrl;

  ImageResponse(this.width, this.height, this.url, this.webpUrl);

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$ImageResponseToJson(this);
}

@JsonSerializable()
class ImageXLargeResponse {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;

  ImageXLargeResponse(this.width, this.height, this.url);

  factory ImageXLargeResponse.fromJson(Map<String, dynamic> json) => _$ImageXLargeResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$ImageXLargeResponseToJson(this);
}

@JsonSerializable()
class AnimatedResponse {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;

  AnimatedResponse(this.width, this.height, this.url);

  factory AnimatedResponse.fromJson(Map<String, dynamic> json) => _$AnimatedResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$AnimatedResponseToJson(this);
}

@JsonSerializable()
class VideoResponse {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;

  VideoResponse(this.width, this.height, this.url);

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$VideoResponseToJson(this);
}