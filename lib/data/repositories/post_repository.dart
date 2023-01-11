import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:nine_gags/data/local/response/tags_response.dart';
import 'package:nine_gags/data/remote/api_service.dart';
import 'package:nine_gags/data/remote/response/list_post_response.dart';

abstract class PostRepository {
  Future<ListPostResponse> fetchPosts(String? query);
  Future<ListPostResponse> fetchTrending(String? query);
  Future<ListPostResponse> fetchFresh(String? query);
  Future<ListPostResponse> fetchTagDetail(String path, String type, String? query);
  Future<TagsResponse> fetchTags();
}

class DefaultPostRepository implements PostRepository {
  final ApiService _apiService;

  DefaultPostRepository({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<ListPostResponse> fetchPosts(String? query) async {
    var nextPage = query?.replaceAll('after=', '');
    final data = await _apiService.fetchPosts(nextPage);
    return data.data;
  }

  @override
  Future<ListPostResponse> fetchTrending(String? query) async {
    var nextPage = query?.replaceAll('after=', '');
    final data = await _apiService.fetchTrending(nextPage);
    return data.data;
  }

  @override
  Future<ListPostResponse> fetchFresh(String? query) async {
    var nextPage = query?.replaceAll('after=', '');
    final data = await _apiService.fetchFresh(nextPage);
    return data.data;
  }

  @override
  Future<ListPostResponse> fetchTagDetail(String path, String type, String? query) async {
    final newPath = path.replaceFirst('/', '');
    final nextPage = query?.replaceFirst('c=', '');
    final data = await _apiService.fetchTagDetail(newPath, type, nextPage);
    return data.data;
  }

  @override
  Future<TagsResponse> fetchTags() async {
    final jsonContent = await rootBundle.loadString('assets/tags.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonContent);

    return TagsResponse.fromJson(jsonData);
  }
}
