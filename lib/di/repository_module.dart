import 'package:nine_gags/data/remote/api_service.dart';
import 'package:nine_gags/data/remote/comment_api_service.dart';
import 'package:nine_gags/data/repositories/comment_repository.dart';
import 'package:nine_gags/data/repositories/post_repository.dart';
import 'package:nine_gags/di/injection.dart';

abstract class RepositoryModule {
  static Future<void> init() async {
    getIt
      ..registerLazySingleton<PostRepository>(() => providePostRepository(getIt()))
      ..registerLazySingleton<CommentRepository>(() => provideCommentRepository(getIt()));
  }

  static PostRepository providePostRepository(ApiService apiService) {
    return DefaultPostRepository(apiService: apiService);
  }

  static CommentRepository provideCommentRepository(CommentApiService apiService) {
    return DefaultCommentRepository(apiService: apiService);
  }
}