
import 'package:json_annotation/json_annotation.dart';
import 'package:nine_gags/data/remote/response/post_response.dart';
import 'package:nine_gags/data/remote/response/tag_response.dart';

part 'list_post_response.g.dart';

@JsonSerializable()
class ListPostResponse {
  @JsonKey(name: 'nextCursor')
  String? nextCursor;
  @JsonKey(name: 'feedId')
  String? feedId;
  @JsonKey(name: 'posts')
  List<PostResponse> posts;
  @JsonKey(name: 'tags')
  List<TagResponse>? tags;

  ListPostResponse(this.nextCursor, this.feedId, this.posts);

  factory ListPostResponse.fromJson(Map<String, dynamic> json) => _$ListPostResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$ListPostResponseToJson(this);
}