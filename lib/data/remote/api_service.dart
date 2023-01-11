
import 'package:dio/dio.dart';
import 'package:nine_gags/data/remote/response/base_response.dart';
import 'package:nine_gags/data/remote/response/list_post_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/feed-posts/type/home')
  Future<BaseResponse<ListPostResponse>> fetchPosts(@Query('after') String? nextPage);

  @GET('/group-posts/type/trending')
  Future<BaseResponse<ListPostResponse>> fetchTrending(@Query('after') String? nextPage);

  @GET('/group-posts/type/fresh')
  Future<BaseResponse<ListPostResponse>> fetchFresh(@Query('after') String? nextPage);

  @GET('/tag-posts/{path}/type/{type}')
  Future<BaseResponse<ListPostResponse>> fetchTagDetail(@Path('path') String path, @Path('type') String type, @Query('c') String? nextPage);
}