import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// The panel that includes the play/pause button and the seek bar.
class ViewerVideoController extends StatelessWidget {
  /// Creates the panel that includes the play/pause button and the seek bar.
  const ViewerVideoController({
    required this.controller,
    super.key,
  });

  /// The video player controller
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PlayButton(controller: controller),
        Expanded(
          child: _SeekBar(controller: controller),
        ),
      ],
    );
  }
}

class _PlayButton extends StatefulWidget {
  const _PlayButton({
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton> {
  @override
  void initState() {
    super.initState();
    _isPlaying = widget.controller.value.isPlaying;
    widget.controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _controllerListener() {
    final newIsPlaying = widget.controller.value.isPlaying;
    if (newIsPlaying != _isPlaying) {
      _isPlaying = newIsPlaying;
      setState(() {});
    }
  }

  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      onPressed: () {
        if (widget.controller.value.isPlaying) {
          widget.controller.pause();
        } else {
          widget.controller.play();
        }
      },
    );
  }
}

class _SeekBar extends StatefulWidget {
  const _SeekBar({
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  State<_SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<_SeekBar> {
  @override
  void initState() {
    super.initState();
    _position = widget.controller.value.position.inMilliseconds.toDouble();
    widget.controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _controllerListener() {
    final newPosition =
        widget.controller.value.position.inMilliseconds.toDouble();
    if (newPosition != _position) {
      _position = newPosition;
      setState(() {});
    }
  }

  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _position,
      max: widget.controller.value.duration.inMilliseconds.toDouble(),
      onChanged: (value) {
        _position = value;
        widget.controller.seekTo(Duration(milliseconds: value.toInt()));
        setState(() {});
      },
    );
  }
}
