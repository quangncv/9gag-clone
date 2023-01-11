// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      id: json['id'] as String?,
      url: json['url'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      nsfw: json['nsfw'] as int?,
      upVoteCount: json['upVoteCount'] as int?,
      downVoteCount: json['downVoteCount'] as int?,
      creationTs: json['creationTs'] as int?,
      promoted: json['promoted'] as int?,
      isVoteMasked: json['isVoteMasked'] as int?,
      hasLongPostCover: json['hasLongPostCover'] as int?,
      images: json['images'] == null
          ? null
          : ImagesResponse.fromJson(json['images'] as Map<String, dynamic>),
      sourceDomain: json['sourceDomain'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      creator: json['creator'] == null
          ? null
          : CreatorResponse.fromJson(json['creator'] as Map<String, dynamic>),
      isAnonymous: json['isAnonymous'] as bool?,
      commentsCount: json['commentsCount'] as int?,
      comment: json['comment'] == null
          ? null
          : CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      postSection: json['postSection'] == null
          ? null
          : PostSectionResponse.fromJson(
              json['postSection'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      annotationTags: (json['annotationTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )..video = json['video'] == null
        ? null
        : VideoResponse.fromJson(json['video'] as Map<String, dynamic>);

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'nsfw': instance.nsfw,
      'upVoteCount': instance.upVoteCount,
      'downVoteCount': instance.downVoteCount,
      'creationTs': instance.creationTs,
      'promoted': instance.promoted,
      'isVoteMasked': instance.isVoteMasked,
      'hasLongPostCover': instance.hasLongPostCover,
      'images': instance.images,
      'video': instance.video,
      'sourceDomain': instance.sourceDomain,
      'sourceUrl': instance.sourceUrl,
      'creator': instance.creator,
      'isAnonymous': instance.isAnonymous,
      'commentsCount': instance.commentsCount,
      'comment': instance.comment,
      'postSection': instance.postSection,
      'tags': instance.tags,
      'annotationTags': instance.annotationTags,
    };

ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) =>
    ImagesResponse(
      image700: json['image700'] == null
          ? null
          : Image700Response.fromJson(json['image700'] as Map<String, dynamic>),
      image460: json['image460'] == null
          ? null
          : Image460Response.fromJson(json['image460'] as Map<String, dynamic>),
      imageFbThumbnail: json['imageFbThumbnail'] == null
          ? null
          : Image700Response.fromJson(
              json['imageFbThumbnail'] as Map<String, dynamic>),
      image460sv: json['image460sv'] == null
          ? null
          : Image460svResponse.fromJson(
              json['image460sv'] as Map<String, dynamic>),
    )..image460c = json['image460c'] == null
        ? null
        : Image460cResponse.fromJson(json['image460c'] as Map<String, dynamic>);

Map<String, dynamic> _$ImagesResponseToJson(ImagesResponse instance) =>
    <String, dynamic>{
      'image700': instance.image700,
      'image460': instance.image460,
      'imageFbThumbnail': instance.imageFbThumbnail,
      'image460sv': instance.image460sv,
      'image460c': instance.image460c,
    };

Image700Response _$Image700ResponseFromJson(Map<String, dynamic> json) =>
    Image700Response(
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$Image700ResponseToJson(Image700Response instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

Image460Response _$Image460ResponseFromJson(Map<String, dynamic> json) =>
    Image460Response(
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      webpUrl: json['webpUrl'] as String?,
    );

Map<String, dynamic> _$Image460ResponseToJson(Image460Response instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'webpUrl': instance.webpUrl,
    };

Image460cResponse _$Image460cResponseFromJson(Map<String, dynamic> json) =>
    Image460cResponse(
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      webpUrl: json['webpUrl'] as String?,
    );

Map<String, dynamic> _$Image460cResponseToJson(Image460cResponse instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'webpUrl': instance.webpUrl,
    };

Image460svResponse _$Image460svResponseFromJson(Map<String, dynamic> json) =>
    Image460svResponse(
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      hasAudio: json['hasAudio'] as int?,
      duration: json['duration'] as int?,
      vp8Url: json['vp8Url'] as String?,
      h265Url: json['h265Url'] as String?,
      vp9Url: json['vp9Url'] as String?,
      av1Url: json['av1Url'] as String?,
    );

Map<String, dynamic> _$Image460svResponseToJson(Image460svResponse instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'hasAudio': instance.hasAudio,
      'duration': instance.duration,
      'vp8Url': instance.vp8Url,
      'h265Url': instance.h265Url,
      'vp9Url': instance.vp9Url,
      'av1Url': instance.av1Url,
    };

CreatorResponse _$CreatorResponseFromJson(Map<String, dynamic> json) =>
    CreatorResponse(
      userId: json['userId'] as String?,
      accountId: json['accountId'] as String?,
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      emojiStatus: json['emojiStatus'] as String?,
      about: json['about'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      profileUrl: json['profileUrl'] as String?,
      isActivePro: json['isActivePro'] as bool?,
      isActiveProPlus: json['isActiveProPlus'] as bool?,
      isVerifiedAccount: json['isVerifiedAccount'] as bool?,
      creationTs: json['creationTs'] as int?,
      activeTs: json['activeTs'] as int?,
      preferences: json['preferences'] == null
          ? null
          : PreferencesResponse.fromJson(
              json['preferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreatorResponseToJson(CreatorResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accountId': instance.accountId,
      'username': instance.username,
      'fullName': instance.fullName,
      'emojiStatus': instance.emojiStatus,
      'about': instance.about,
      'avatarUrl': instance.avatarUrl,
      'profileUrl': instance.profileUrl,
      'isActivePro': instance.isActivePro,
      'isActiveProPlus': instance.isActiveProPlus,
      'isVerifiedAccount': instance.isVerifiedAccount,
      'creationTs': instance.creationTs,
      'activeTs': instance.activeTs,
      'preferences': instance.preferences,
    };

PreferencesResponse _$PreferencesResponseFromJson(Map<String, dynamic> json) =>
    PreferencesResponse(
      hideProBadge: json['hideProBadge'] as int?,
      hideActiveTs: json['hideActiveTs'] as int?,
      accentColor: json['accentColor'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
    );

Map<String, dynamic> _$PreferencesResponseToJson(
        PreferencesResponse instance) =>
    <String, dynamic>{
      'hideProBadge': instance.hideProBadge,
      'hideActiveTs': instance.hideActiveTs,
      'accentColor': instance.accentColor,
      'backgroundColor': instance.backgroundColor,
    };

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      listType: json['listType'] as String?,
      updateTs: json['updateTs'] as int?,
      latestCommentText: json['latestCommentText'] as String?,
      opToken: json['opToken'] as String?,
      canAnonymous: json['canAnonymous'] as bool?,
      pinnedCommentCount: json['pinnedCommentCount'] as int?,
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'listType': instance.listType,
      'updateTs': instance.updateTs,
      'latestCommentText': instance.latestCommentText,
      'opToken': instance.opToken,
      'canAnonymous': instance.canAnonymous,
      'pinnedCommentCount': instance.pinnedCommentCount,
    };

PostSectionResponse _$PostSectionResponseFromJson(Map<String, dynamic> json) =>
    PostSectionResponse(
      name: json['name'] as String?,
      url: json['url'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$PostSectionResponseToJson(
        PostSectionResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
    };

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) =>
    VideoResponse(
      json['id'] as String,
      json['source'] as String,
    );

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
    };
