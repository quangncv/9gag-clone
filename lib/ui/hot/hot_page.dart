import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:nine_gags/data/remote/response/post_response.dart';
import 'package:nine_gags/data/remote/response/tag_response.dart';
import 'package:nine_gags/data/repositories/post_repository.dart';
import 'package:nine_gags/di/injection.dart';
import 'package:nine_gags/widgets/post_view.dart';
import 'package:nine_gags/widgets/tag_view.dart';

class HotPage extends StatefulWidget {
  const HotPage({Key? key}) : super(key: key);

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> with AutomaticKeepAliveClientMixin {
  final repository = getIt.get<PostRepository>();

  final List<PostResponse> posts = [];
  final List<TagResponse> tags = [];
  late ScrollController _scrollController;

  String? nextPage;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        loadMore();
      });
    fetchData();
  }

  void loadMore() async {
    if (nextPage != null &&
        nextPage != '' &&
        !isFirstLoadRunning &&
        !isLoadMoreRunning &&
        _scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true;
      final data = await repository.fetchPosts(nextPage);
      nextPage = data.nextCursor;
      setState(() {
        posts.addAll(data.posts);
      });
      isLoadMoreRunning = false;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {
      loadMore();
    });
    super.dispose();
  }

  void fetchData() async {
    isFirstLoadRunning = true;
    final data = await repository.fetchPosts(null);
    nextPage = data.nextCursor;
    setState(() {
      tags.addAll(data.tags ?? []);
      posts.addAll(data.posts);
    });

    isFirstLoadRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InViewNotifierCustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tags.map((e) => TagView(tag: e)).toList(),
            ),
          )
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return InViewNotifierWidget(
                  id: '$index',
                  builder: (context, isInView, child) {
                    return PostView(post: posts[index], isInView: isInView);
                  });
            },
            childCount: posts.length,
          ),
        ),
      ],
      isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) {
        return deltaTop < (0.5 * vpHeight) && deltaBottom > (0.5 * vpHeight);
      },
    );

    // return InViewNotifierList(
    //   builder: (context, index) {
    //     return InViewNotifierWidget(
    //         id: '$index',
    //         builder: (context, isInView, child) {
    //           if (isInView) {
    //             log('index visible: $index');
    //           }
    //           return PostView(post: posts[index], isInView: isInView);
    //         });
    //   },
    //   isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) {
    //     return deltaTop < (0.5 * vpHeight) && deltaBottom > (0.5 * vpHeight);
    //   },
    //   itemCount: posts.length,
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
