
import 'package:dio/dio.dart';
import 'package:nine_gags/data/remote/response/base_comment_response.dart';
import 'package:nine_gags/data/remote/response/list_comment_response.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_api_service.g.dart';

@RestApi()
abstract class CommentApiService {
  factory CommentApiService(Dio dio, {String baseUrl}) = _CommentApiService;

  @GET('/cacheable/comment-list.json')
  Future<BaseCommentResponse<ListCommentResponse>> fetchComments(@Query('appId') String appId, @Query('count') int count, @Query('type') String type, @Query('url') String url);

  @GET('/cacheable/comment-list.json')
  Future<BaseCommentResponse<ListCommentResponse>> fetchChildComments(@Query('appId') String appId, @Query('count') int count, @Query('level') int level, @Query('url') String url, @Query('commentId') String commentId);
}