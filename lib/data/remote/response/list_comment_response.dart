import 'package:json_annotation/json_annotation.dart';
import 'package:nine_gags/data/remote/response/comment_response.dart';

part 'list_comment_response.g.dart';

@JsonSerializable()
class ListCommentResponse {
  @JsonKey(name: 'total')
  int total;
  @JsonKey(name: 'comments')
  List<CommentResponse> comments;
  @JsonKey(name: 'next')
  String? next;

  ListCommentResponse(this.total, this.comments, this.next);

  factory ListCommentResponse.fromJson(Map<String, dynamic> json) => _$ListCommentResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$ListCommentResponseToJson(this);
}