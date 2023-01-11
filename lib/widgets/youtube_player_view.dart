import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerView extends StatefulWidget {
  final String id;
  final bool isInView;

  const YoutubePlayerView({Key? key, required this.id, required this.isInView}) : super(key: key);

  @override
  State<YoutubePlayerView> createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        hideControls: true
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isInView) {
      _controller.play();
    } else {
      _controller.pause();
    }

    return Container(
      child: YoutubePlayer(
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
