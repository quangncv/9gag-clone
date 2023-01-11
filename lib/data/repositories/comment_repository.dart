import 'package:nine_gags/data/remote/comment_api_service.dart';
import 'package:nine_gags/data/remote/response/list_comment_response.dart';

abstract class CommentRepository {
  Future<ListCommentResponse> fetchComments(String postId);
  Future<ListCommentResponse> fetchChildComments(String commentId, String postId);
}

class DefaultCommentRepository implements CommentRepository {
  late final CommentApiService _apiService;

  DefaultCommentRepository({required CommentApiService apiService}) : _apiService = apiService;

  @override
  Future<ListCommentResponse> fetchComments(String postId) async {
    final data = await _apiService.fetchComments('a_dd8f2b7d304a10edaf6f29517ea0ca4100a43d1b', 10, 'hot', 'http%3A%2F%2F9gag.com%2Fgag%2F$postId');

    return data.payload;
  }

  @override
  Future<ListCommentResponse> fetchChildComments(String commentId, String postId) async {
    final data = await _apiService.fetchChildComments('a_dd8f2b7d304a10edaf6f29517ea0ca4100a43d1b', 10, 2, 'http%3A%2F%2F9gag.com%2Fgag%2F$postId', commentId);

    return data.payload;
  }


}