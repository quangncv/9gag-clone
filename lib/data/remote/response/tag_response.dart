import 'package:json_annotation/json_annotation.dart';

part 'tag_response.g.dart';

@JsonSerializable()
class TagResponse {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'url')
  String? url;

  TagResponse({this.key, this.url});

  factory TagResponse.fromJson(Map<String, dynamic> json) => _$TagResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$TagResponseToJson(this);
}