import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nine_gags/data/remote/response/comment_response.dart';
import 'package:nine_gags/data/remote/response/post_response.dart' as post;
import 'package:nine_gags/data/remote/response/tag_response.dart';
import 'package:nine_gags/ui/comment/comment_page.dart';
import 'package:nine_gags/ui/comment_thread/comment_thread_page.dart';
import 'package:nine_gags/ui/home/home_page.dart';
import 'package:nine_gags/ui/preview/image_preview_page.dart';
import 'package:nine_gags/ui/tag_detail/tag_detail_page.dart';

Route<dynamic> generatorRoute(RouteSettings settings) {
  final args = settings.arguments;
  log('args: $args');
  var routes = <String, WidgetBuilder>{
    '$HomePage': (context) => const HomePage(),
    '$TagDetailPage': (context) => TagDetailPage(tag: args as TagResponse,),
    '$CommentPage': (context) => CommentPage(post: args as post.PostResponse,),
    '$ImagePreviewPage': (context) => ImagePreviewPage(imageUrl: args as String,),
    '$CommentThreadPage': (context) => CommentThreadPage(comment: (args as CommentThreadArguments).comment, postId: args.postId,),
  };

  WidgetBuilder? builder = routes[settings.name];

  return builder != null
      ? MaterialPageRoute(builder: (context) => builder(context))
      : MaterialPageRoute(builder: (context) => const HomePage());
}

class CommentThreadArguments {
  final CommentResponse comment;
  final String postId;

  CommentThreadArguments(this.comment, this.postId);
}