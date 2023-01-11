import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:nine_gags/common/theme.dart';
import 'package:nine_gags/data/remote/response/comment_response.dart';
import 'package:nine_gags/data/repositories/comment_repository.dart';
import 'package:nine_gags/di/injection.dart';
import 'package:nine_gags/widgets/comment_view.dart';

class CommentThreadPage extends StatefulWidget {
  final CommentResponse comment;
  final String postId;

  const CommentThreadPage(
      {Key? key, required this.comment, required this.postId})
      : super(key: key);

  @override
  State<CommentThreadPage> createState() => _CommentThreadPageState();
}

class _CommentThreadPageState extends State<CommentThreadPage> {
  final commentRepository = getIt.get<CommentRepository>();

  final List<CommentResponse> comments = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await commentRepository.fetchChildComments(
        widget.comment.commentId ?? '', widget.postId);
    setState(() {
      comments.add(widget.comment);
      comments.addAll(data.comments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Thread',
          style: PrimaryFont.din(22, FontWeight.bold)
              .copyWith(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: InViewNotifierList(
          isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) {
            return deltaTop < (0.5 * vpHeight) && deltaBottom > (0.5 * vpHeight);
          },
          builder: (context, index) {
            return InViewNotifierWidget(id: '$index', builder: (context, isInView, child) {
              return CommentView(comment: comments[index], isInView: isInView, postId: null);
            });
          },
          itemCount: comments.length,
        ),
      ),
    );
  }
}
