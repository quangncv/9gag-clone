import 'package:json_annotation/json_annotation.dart';
import 'package:nine_gags/data/remote/response/tag_response.dart';

part 'tags_response.g.dart';

@JsonSerializable()
class TagsResponse {
  @JsonKey(name: 'popular')
  List<TagResponse> popular;
  @JsonKey(name: 'other')
  List<TagResponse> other;
  @JsonKey(name: 'trending')
  List<TagResponse> trending;

  TagsResponse(this.popular, this.other, this.trending);

  factory TagsResponse.fromJson(Map<String, dynamic> json) => _$TagsResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$TagsResponseToJson(this);
}