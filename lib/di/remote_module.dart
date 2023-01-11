import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nine_gags/data/remote/api_service.dart';
import 'package:nine_gags/data/remote/comment_api_service.dart';
import 'package:nine_gags/di/injection.dart';

abstract class RemoteModule {
  static Future<void> init() async {
    getIt
      ..registerLazySingleton<Dio>(() => provideDioClient(), instanceName: 'post_api')
      ..registerLazySingleton<Dio>(() => provideCommentDioClient(), instanceName: 'comment_api')
      ..registerLazySingleton<ApiService>(() => provideApiService(getIt(instanceName: 'post_api')))
      ..registerLazySingleton<CommentApiService>(() => provideCommentApiService(getIt(instanceName: 'comment_api')));
  }

  static Dio provideDioClient() {
    final dio = Dio();

    dio
      ..options.baseUrl = utf8.decode(base64.decode('aHR0cHM6Ly85Z2FnLmNvbS92MS8='))
      ..options.receiveTimeout = 15000
      ..options.sendTimeout = 15000
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(EncodingInterceptor())
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    return dio;
  }

  static Dio provideCommentDioClient() {
    final dio = Dio();

    dio
      ..options.baseUrl = utf8.decode(base64.decode('aHR0cHM6Ly9jb21tZW50LWNkbi45Z2FnLmNvbS92Mi8='))
      ..options.receiveTimeout = 15000
      ..options.sendTimeout = 15000
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(EncodingInterceptor())
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    return dio;
  }

  static ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }

  static CommentApiService provideCommentApiService(Dio dio) {
    return CommentApiService(dio);
  }
}

class EncodingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.queryParameters.isEmpty) {
      super.onRequest(options, handler);
      return;
    }

    final queryParams = _getQueryParams(options.queryParameters);
    handler.next(
      options.copyWith(
        path: _getNormalizedUrl(options.path, queryParams),
        queryParameters: Map.from({}),
      ),
    );
  }

  String _getNormalizedUrl(String baseUrl, String queryParams) {
    if (baseUrl.contains("?")) {
      return baseUrl + "&$queryParams";
    } else {
      return baseUrl + "?$queryParams";
    }
  }

  String _getQueryParams(Map<String, dynamic> map) {
    String result = "";
    map.forEach((key, value) {
      result += "$key=${value}&";
    });
    return result;
  }
}