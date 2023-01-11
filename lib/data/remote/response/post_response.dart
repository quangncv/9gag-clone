
import 'package:json_annotation/json_annotation.dart';
import 'package:nine_gags/data/remote/response/tag_response.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'nsfw')
  int? nsfw;
  @JsonKey(name: 'upVoteCount')
  int? upVoteCount;
  @JsonKey(name: 'downVoteCount')
  int? downVoteCount;
  @JsonKey(name: 'creationTs')
  int? creationTs;
  @JsonKey(name: 'promoted')
  int? promoted;
  @JsonKey(name: 'isVoteMasked')
  int? isVoteMasked;
  @JsonKey(name: 'hasLongPostCover')
  int? hasLongPostCover;
  @JsonKey(name: 'images')
  ImagesResponse? images;
  @JsonKey(name: 'video')
  VideoResponse? video;
  @JsonKey(name: 'sourceDomain')
  String? sourceDomain;
  @JsonKey(name: 'sourceUrl')
  String? sourceUrl;
  @JsonKey(name: 'creator')
  CreatorResponse? creator;
  @JsonKey(name: 'isAnonymous')
  bool? isAnonymous;
  @JsonKey(name: 'commentsCount')
  int? commentsCount;
  @JsonKey(name: 'comment')
  CommentResponse? comment;
  @JsonKey(name: 'postSection')
  PostSectionResponse? postSection;
  @JsonKey(name: 'tags')
  List<TagResponse>? tags;
  @JsonKey(name: 'annotationTags')
  List<String>? annotationTags;

  PostResponse(
      {this.id,
        this.url,
        this.title,
        this.description,
        this.type,
        this.nsfw,
        this.upVoteCount,
        this.downVoteCount,
        this.creationTs,
        this.promoted,
        this.isVoteMasked,
        this.hasLongPostCover,
        this.images,
        this.sourceDomain,
        this.sourceUrl,
        this.creator,
        this.isAnonymous,
        this.commentsCount,
        this.comment,
        this.postSection,
        this.tags,
        this.annotationTags});

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$PostResponseToJson(this);

  String? getCover() {
    if (hasLongPostCover == 0) {
      return images?.image460?.webpUrl;
    } else {
      return images?.image460c?.url;
    }
  }

  String? getFullCover() {
    return images?.image460?.webpUrl;
  }

  String? getFullPreviewCover() {
    return images?.image460?.webpUrl;
  }
}

@JsonSerializable()
class ImagesResponse {
  @JsonKey(name: 'image700')
  Image700Response? image700;
  @JsonKey(name: 'image460')
  Image460Response? image460;
  @JsonKey(name: 'imageFbThumbnail')
  Image700Response? imageFbThumbnail;
  @JsonKey(name: 'image460sv')
  Image460svResponse? image460sv;
  @JsonKey(name: 'image460c')
  Image460cResponse? image460c;

  ImagesResponse(
      {this.image700, this.image460, this.imageFbThumbnail, this.image460sv});

  factory ImagesResponse.fromJson(Map<String, dynamic> json) => _$ImagesResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$ImagesResponseToJson(this);

}

@JsonSerializable()
class Image700Response {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;

  Image700Response({this.width, this.height, this.url});

  factory Image700Response.fromJson(Map<String, dynamic> json) => _$Image700ResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$Image700ResponseToJson(this);
}

@JsonSerializable()
class Image460Response {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'webpUrl')
  String? webpUrl;

  Image460Response({this.width, this.height, this.url, this.webpUrl});

  factory Image460Response.fromJson(Map<String, dynamic> json) => _$Image460ResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$Image460ResponseToJson(this);
}

@JsonSerializable()
class Image460cResponse {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'webpUrl')
  String? webpUrl;

  Image460cResponse({this.width, this.height, this.url, this.webpUrl});

  factory Image460cResponse.fromJson(Map<String, dynamic> json) => _$Image460cResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$Image460cResponseToJson(this);
}

@JsonSerializable()
class Image460svResponse {
  @JsonKey(name: 'width')
  int? width;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'hasAudio')
  int? hasAudio;
  @JsonKey(name: 'duration')
  int? duration;
  @JsonKey(name: 'vp8Url')
  String? vp8Url;
  @JsonKey(name: 'h265Url')
  String? h265Url;
  @JsonKey(name: 'vp9Url')
  String? vp9Url;
  @JsonKey(name: 'av1Url')
  String? av1Url;

  Image460svResponse(
      {this.width,
        this.height,
        this.url,
        this.hasAudio,
        this.duration,
        this.vp8Url,
        this.h265Url,
        this.vp9Url,
        this.av1Url});

  factory Image460svResponse.fromJson(Map<String, dynamic> json) => _$Image460svResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$Image460svResponseToJson(this);
}

@JsonSerializable()
class CreatorResponse {
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'accountId')
  String? accountId;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'fullName')
  String? fullName;
  @JsonKey(name: 'emojiStatus')
  String? emojiStatus;
  @JsonKey(name: 'about')
  String? about;
  @JsonKey(name: 'avatarUrl')
  String? avatarUrl;
  @JsonKey(name: 'profileUrl')
  String? profileUrl;
  @JsonKey(name: 'isActivePro')
  bool? isActivePro;
  @JsonKey(name: 'isActiveProPlus')
  bool? isActiveProPlus;
  @JsonKey(name: 'isVerifiedAccount')
  bool? isVerifiedAccount;
  @JsonKey(name: 'creationTs')
  int? creationTs;
  @JsonKey(name: 'activeTs')
  int? activeTs;
  @JsonKey(name: 'preferences')
  PreferencesResponse? preferences;

  CreatorResponse(
      {this.userId,
        this.accountId,
        this.username,
        this.fullName,
        this.emojiStatus,
        this.about,
        this.avatarUrl,
        this.profileUrl,
        this.isActivePro,
        this.isActiveProPlus,
        this.isVerifiedAccount,
        this.creationTs,
        this.activeTs,
        this.preferences});

  factory CreatorResponse.fromJson(Map<String, dynamic> json) => _$CreatorResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$CreatorResponseToJson(this);
}

@JsonSerializable()
class PreferencesResponse {
  @JsonKey(name: 'hideProBadge')
  int? hideProBadge;
  @JsonKey(name: 'hideActiveTs')
  int? hideActiveTs;
  @JsonKey(name: 'accentColor')
  String? accentColor;
  @JsonKey(name: 'backgroundColor')
  String? backgroundColor;

  PreferencesResponse(
      {this.hideProBadge,
        this.hideActiveTs,
        this.accentColor,
        this.backgroundColor});

  factory PreferencesResponse.fromJson(Map<String, dynamic> json) => _$PreferencesResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$PreferencesResponseToJson(this);
}

@JsonSerializable()
class CommentResponse {
  @JsonKey(name: 'listType')
  String? listType;
  @JsonKey(name: 'updateTs')
  int? updateTs;
  @JsonKey(name: 'latestCommentText')
  String? latestCommentText;
  @JsonKey(name: 'opToken')
  String? opToken;
  @JsonKey(name: 'canAnonymous')
  bool? canAnonymous;
  @JsonKey(name: 'pinnedCommentCount')
  int? pinnedCommentCount;

  CommentResponse(
      {this.listType,
        this.updateTs,
        this.latestCommentText,
        this.opToken,
        this.canAnonymous,
        this.pinnedCommentCount});

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$CommentResponseToJson(this);
}

@JsonSerializable()
class PostSectionResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  PostSectionResponse({this.name, this.url, this.imageUrl});

  factory PostSectionResponse.fromJson(Map<String, dynamic> json) => _$PostSectionResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$PostSectionResponseToJson(this);
}

@JsonSerializable()
class VideoResponse {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'source')
  String source;

  VideoResponse(this.id, this.source);

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$VideoResponseToJson(this);
}