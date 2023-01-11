import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nine_gags/common/constants.dart';
import 'package:nine_gags/common/theme.dart';
import 'package:nine_gags/data/remote/response/post_response.dart';
import 'package:nine_gags/ui/comment/comment_page.dart';
import 'package:nine_gags/ui/preview/image_preview_page.dart';
import 'package:nine_gags/utils/date_time_utils.dart';
import 'package:nine_gags/widgets/tag_view.dart';
import 'package:nine_gags/widgets/video_view.dart';
import 'package:nine_gags/widgets/youtube_player_view.dart';

class PostDetailView extends StatelessWidget {
  final PostResponse post;
  final bool isInView;

  const PostDetailView({Key? key, required this.post, required this.isInView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(post.creator?.avatarUrl ??
                          post.postSection?.imageUrl ??
                          ''),
                      radius: 10,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${post.creator?.username ?? post.postSection?.name}',
                      style: PrimaryFont.din(12, FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      DateTimeUtils().distanceToNow(post.creationTs ?? 0),
                      style: PrimaryFont.din(12, FontWeight.bold).copyWith(
                        color: const Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${post.title}',
                  style: PrimaryFont.din(16, FontWeight.bold),
                ),
              ],
            ),
          ),
          if (post.type == 'Photo')
            Container(
              color: Colors.black,
              child: Center(
                child: GestureDetector(
                  child: Image.network('${post.getFullCover()}'),
                  onTap: () {
                    Navigator.of(context).pushNamed('$ImagePreviewPage', arguments: post.getFullPreviewCover());
                  },
                ),
              ),
            )
          else if (post.type == 'Video')
            YoutubePlayerView(id: '${post.video?.id}', isInView: isInView)
          else
            Stack(
              alignment: FractionalOffset.bottomRight +
                  const FractionalOffset(-0.1, -0.1),
              children: [
                VideoView(
                  videoUrl: '${post.images?.image460sv?.vp8Url}',
                  thumbnail: '${post.images?.image460?.webpUrl}',
                  isInView: isInView,
                ),
              ],
            ),
          Wrap(
              spacing: 5,
              children: (post.tags ?? []).map((e) {
                return TagView(tag: e);
              }).toList()),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.icUpVote),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        NumberFormat.compact().format(post.upVoteCount),
                        style: PrimaryFont.din(12, FontWeight.bold)
                            .copyWith(color: const Color(0xFF222222)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.icDownVote),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        NumberFormat.compact().format(post.downVoteCount),
                        style: PrimaryFont.din(12, FontWeight.bold)
                            .copyWith(color: const Color(0xFF222222)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('$CommentPage', arguments: post);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.icComment),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        NumberFormat.compact().format(post.commentsCount),
                        style: PrimaryFont.din(12, FontWeight.bold)
                            .copyWith(color: const Color(0xFF222222)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.icShare),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'SHARE',
                        style: PrimaryFont.din(12, FontWeight.bold)
                            .copyWith(color: const Color(0xFF222222)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
