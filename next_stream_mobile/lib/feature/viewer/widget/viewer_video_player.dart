import 'package:flutter/material.dart';
import 'package:next_stream_mobile/product/logger/log.dart';
import 'package:video_player/video_player.dart';

/// The video player widget for the viewer screen.
class ViewerVideoPlayer extends StatelessWidget {
  /// Creates the video player widget for the viewer screen.
  const ViewerVideoPlayer({
    required this.videoPlayerController,
    super.key,
  });

  /// The video player controller
  final VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final maxHeight = width * 0.8;
    final videoSize = _calcVideoSize(
      width,
      MediaQuery.of(context).size.height,
      videoPlayerController.value.size.width,
      videoPlayerController.value.size.height,
      width,
      maxHeight,
    );

    return Container(
      alignment: Alignment.center,
      width: width,
      color: Colors.black,
      child: SizedBox(
        width: videoSize.width,
        height: videoSize.height,
        child: VideoPlayer(videoPlayerController),
      ),
    );
  }

  Size _calcVideoSize(
    double screenW,
    double screenH,
    double videoW,
    double videoH,
    double maxW,
    double maxH,
  ) {
    if (videoW == 0 || videoH == 0) {
      return Size.zero;
    }

    final maxRatio = screenW / maxH;
    final videoRatio = videoW / videoH;
    final double resultWidth;
    final double resultHeight;

    if (maxRatio > videoRatio) {
      resultWidth = videoW * maxH / videoH;
      resultHeight = maxH;
    } else {
      resultWidth = maxW;
      resultHeight = videoH * maxW / videoW;
    }

    L.d('screenW: $screenW, '
        'screenH: $screenH, '
        'videoW: $videoW, '
        'videoH: $videoH, '
        'maxW: $maxW, '
        'maxH: $maxH, '
        'screenRatio: $maxRatio, '
        'videoRatio: $videoRatio, '
        'resultWidth: $resultWidth, '
        'resultHeight: $resultHeight');

    return Size(resultWidth, resultHeight);
  }
}
