import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:nine_gags/common/theme.dart';
import 'package:nine_gags/data/remote/response/post_response.dart';
import 'package:nine_gags/data/remote/response/comment_response.dart'
    as comment;
import 'package:nine_gags/data/repositories/comment_repository.dart';
import 'package:nine_gags/di/injection.dart';
import 'package:nine_gags/widgets/comment_view.dart';
import 'package:nine_gags/widgets/post_detail_view.dart';
import 'package:nine_gags/widgets/post_view.dart';

class CommentPage extends StatefulWidget {
  final PostResponse post;

  const CommentPage({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final commentRepository = getIt.get<CommentRepository>();

  final List<comment.CommentResponse> comments = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await commentRepository.fetchComments(widget.post.id ?? '');
    setState(() {
      comments.addAll(data.comments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Post',
          style: PrimaryFont.din(20, FontWeight.bold)
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: InViewNotifierCustomScrollView(
          isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) {
            return deltaTop < (0.5 * vpHeight) &&
                deltaBottom > (0.5 * vpHeight);
          },
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  InViewNotifierWidget(
                    id: 'post',
                    builder: (context, isInView, child) {
                      return PostDetailView(post: widget.post, isInView: isInView);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hot comments',
                          style: PrimaryFont.din(14, FontWeight.bold)
                              .copyWith(color: const Color(0xFF666666)),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF666666),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InViewNotifierWidget(
                      id: '$index',
                      builder: (context, isInView, child) {
                        return CommentView(
                            comment: comments[index], postId: widget.post.id ?? '', isInView: isInView);
                      });
                },
                childCount: comments.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
