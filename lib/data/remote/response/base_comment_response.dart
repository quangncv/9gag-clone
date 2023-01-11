import 'package:json_annotation/json_annotation.dart';

part 'base_comment_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseCommentResponse<T> {
  @JsonKey(name: 'payload')
  final T payload;

  BaseCommentResponse(this.payload);

  factory BaseCommentResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$BaseCommentResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseCommentResponseToJson(this, toJsonT);
}