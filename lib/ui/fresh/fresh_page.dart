import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:nine_gags/data/remote/response/post_response.dart';
import 'package:nine_gags/data/repositories/post_repository.dart';
import 'package:nine_gags/di/injection.dart';
import 'package:nine_gags/widgets/post_view.dart';

class FreshPage extends StatefulWidget {
  const FreshPage({Key? key}) : super(key: key);

  @override
  State<FreshPage> createState() => _FreshPageState();
}

class _FreshPageState extends State<FreshPage> with AutomaticKeepAliveClientMixin {
  final repository = getIt.get<PostRepository>();

  final List<PostResponse> posts = [];
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

  void fetchData() async {
    isFirstLoadRunning = true;
    final data = await repository.fetchFresh(null);
    nextPage = data.nextCursor;
    setState(() {
      posts.addAll(data.posts);
    });
    isFirstLoadRunning = false;
  }

  void loadMore() async {
    if (nextPage != null &&
        nextPage != '' &&
        !isFirstLoadRunning &&
        !isLoadMoreRunning &&
        _scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true;
      final data = await repository.fetchFresh(nextPage);
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InViewNotifierCustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return InViewNotifierWidget(
              id: '$index',
              builder: (context, isInView, child) {
                return PostView(post: posts[index], isInView: isInView);
              });
        }, childCount: posts.length,))
      ],
      isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) {
        return deltaTop < (0.5 * vpHeight) && deltaBottom > (0.5 * vpHeight);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
