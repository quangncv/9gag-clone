import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nine_gags/common/constants.dart';
import 'package:nine_gags/common/routes.dart';
import 'package:nine_gags/common/theme.dart';
import 'package:nine_gags/data/remote/response/comment_response.dart';
import 'package:nine_gags/ui/comment_thread/comment_thread_page.dart';
import 'package:nine_gags/utils/date_time_utils.dart';
import 'package:nine_gags/widgets/gif_player.dart';
import 'package:nine_gags/widgets/video_view.dart';

class CommentView extends StatelessWidget {
  final CommentResponse comment;
  final String? postId;
  final bool isInView;

  const CommentView({Key? key, required this.comment, required this.isInView, required this.postId})
      : super(key: key);

  List<TextSpan> _mentionParser(String message, Iterable<dynamic> mentions) {
    if (message.isEmpty) {
      return [];
    }

    for (final mention in mentions) { //ough the list of names to replace
      if (message.contains("$mention")) { // If the message contains the name to replace
        List<TextSpan> children = [];
        String preUsernameMessage = message.substring(0, message.indexOf('$mention')).trimLeft(); // Get everything before the mention
        if (preUsernameMessage.isNotEmpty) {
          children.add(TextSpan(children: _mentionParser(preUsernameMessage, mentions)));
        } // if it isn't empty, recurse and add to the list

        children.add( // Always add the display name to the list
            TextSpan(
                text: "$mention".trim(),
                style: PrimaryFont.din(12, FontWeight.bold).copyWith(
                  color: const Color(0xff2e6da4)
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => {}
            )
        );

        String postUsernameMessage = message.substring(message.indexOf('$mention') + '$mention'.length, message.length).trimRight(); // Get everything after the mention
        if (postUsernameMessage.isNotEmpty) {
          children.add(TextSpan(children: _mentionParser(postUsernameMessage, mentions)));
        }

        return children; // return the constructed list
      }
    }
    log(message);
    return [TextSpan(text: message, style: PrimaryFont.din(12, FontWeight.normal).copyWith(color: Colors.black))]; // If the string didn't contain any of the strings to replace, then just return the message as passed.
  }

  @override
  Widget build(BuildContext context) {
    final mentions = (comment.mentionMapping as Map).keys.toList().where((element) => '$element' != 'dummy');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Color(0x60999999)),
          ),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('${comment.user?.avatarUrl}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${comment.user?.displayName}',
                      style: PrimaryFont.din(12, FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      DateTimeUtils().distanceToNow(1673233267),
                      style: PrimaryFont.din(12, FontWeight.bold).copyWith(
                        color: const Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                if (comment.text?.isNotEmpty == true)
                  RichText(text: TextSpan(
                      children: _mentionParser('${comment.text}', mentions)
                  ),),
                  // Text(
                  //   '${comment.text}',
                  //   style: PrimaryFont.din(12, FontWeight.normal),
                  // ),
                if (comment.type == 'userMedia' &&
                    comment.getMediaType() == 'STATIC')
                  Image.network('${comment.getMedia()}')
                else if (comment.type == 'userMedia' &&
                    comment.getMediaType() == 'ANIMATED')
                  if (comment.isGif())
                     // Image.network('${comment.getMedia()}')
                     GifPlayer(gifUrl: '${comment.getMedia()}')
                  else
                    VideoView(
                        videoUrl: '${comment.getMedia()}',
                        isInView: isInView,
                        thumbnail:
                            '${comment.media?.first.imageMetaByType?.image?.webpUrl}'),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      child: Text(
                        'Reply',
                        style: PrimaryFont.din(14, FontWeight.bold).copyWith(
                          color: const Color(0xFF666666),
                        ),
                      ),
                    ),
                    MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minWidth: 0,
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.icUpVote,
                            width: 14,
                            color: const Color(0xFF666666),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            NumberFormat.compact().format(1000),
                            style: PrimaryFont.din(14, FontWeight.bold)
                                .copyWith(color: const Color(0xFF666666)),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minWidth: 0,
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.icDownVote,
                            width: 14,
                            color: const Color(0xFF666666),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            NumberFormat.compact().format(1500),
                            style: PrimaryFont.din(14, FontWeight.bold)
                                .copyWith(color: const Color(0xFF666666)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                if ((comment.childrenTotal ?? 0) > 0 && postId != null)
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('$CommentThreadPage', arguments: CommentThreadArguments(comment, postId ?? ''));
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blueAccent,
                        ),
                        Text(
                          'View ${comment.childrenTotal} replies',
                          style: PrimaryFont.din(14, FontWeight.bold)
                              .copyWith(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
