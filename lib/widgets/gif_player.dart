import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class GifPlayer extends StatefulWidget {
  final String gifUrl;
  const GifPlayer({Key? key, required this.gifUrl}) : super(key: key);

  @override
  _GifPlayerState createState() => _GifPlayerState();
}

class _GifPlayerState extends State<GifPlayer> with AutomaticKeepAliveClientMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GifView.network(widget.gifUrl, controller: _controller,);
  }

  @override
  bool get wantKeepAlive => true;
}
