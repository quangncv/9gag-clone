// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCommentResponse<T> _$BaseCommentResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseCommentResponse<T>(
      fromJsonT(json['payload']),
    );

Map<String, dynamic> _$BaseCommentResponseToJson<T>(
  BaseCommentResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'payload': toJsonT(instance.payload),
    };
