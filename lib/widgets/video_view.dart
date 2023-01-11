import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String videoUrl;
  final String thumbnail;
  final bool isInView;

  const VideoView({
    Key? key,
    required this.videoUrl,
    required this.isInView,
    required this.thumbnail,
  }) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network(widget.videoUrl);
    //
    // _initializeVideoPlayerFuture = _controller.initialize().then((_) {
    //   setState(() {
    //     _controller.play();
    //   });
    // });
    //
    // if (widget.isInView) {
    //   _controller.play();
    //   _controller.setLooping(true);
    // }

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _controller = VideoPlayerController.network(widget.videoUrl);
    await Future.wait([_controller.initialize()]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      autoInitialize: true,
        videoPlayerController: _controller,
        aspectRatio: _controller.value.aspectRatio,
        showOptions: false);

    if (widget.isInView) {
      _controller.play();
    }
  }

  @override
  void didUpdateWidget(VideoView oldWidget) {
    if (oldWidget.isInView != widget.isInView) {
      if (widget.isInView) {
        _controller.play();
      } else {
        _controller.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? AspectRatio(
            aspectRatio:
                _chewieController!.videoPlayerController.value.aspectRatio,
            child: Container(
              color: Colors.black,
              child: Chewie(
                controller: _chewieController!,
              ),
            ),
          )
        : Image.network(
            widget.thumbnail,
          );
    // return FutureBuilder(
    //   future: _initializeVideoPlayerFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return AspectRatio(
    //         aspectRatio: _controller.value.aspectRatio,
    //         child: Stack(
    //           alignment: Alignment.bottomCenter,
    //           children: [
    //             VideoPlayer(
    //               _controller,
    //             ),
    //             if (!_controller.value.isPlaying)
    //               Container(
    //                 color: const Color(0x50000000),
    //                 child: Stack(
    //                   children: [
    //                     Center(
    //                       child: IconButton(
    //                         onPressed: () {
    //                           setState(() {
    //                             _controller.play();
    //                           });
    //                         },
    //                         icon: const Icon(
    //                           Icons.play_arrow,
    //                           color: Colors.white,
    //                           size: 50,
    //                         ),
    //                       ),
    //                     ),
    //                     Positioned(
    //                       bottom: 0,
    //                       right: 0,
    //                       child: IconButton(
    //                         onPressed: () {
    //
    //                         },
    //                         icon: const Icon(
    //                           Icons.fullscreen,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             VideoProgressIndicator(_controller, allowScrubbing: false),
    //           ],
    //         ),
    //       );
    //     } else {
    //       return Image.network(widget.thumbnail);
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
