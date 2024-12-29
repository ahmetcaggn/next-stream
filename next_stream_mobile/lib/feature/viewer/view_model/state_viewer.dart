import 'package:next_stream_mobile/product/network/response/model_video.dart';
import 'package:video_player/video_player.dart';

/// Base state class for Viewer screen states
abstract class StateViewer {
  /// Data Viewer
  const StateViewer();
}

/// State Viewer screen initial
class StateViewerInitial extends StateViewer {
  /// Creates instance of [StateViewerInitial]
  const StateViewerInitial();
}

/// State class for loaded Viewer screen
class StateViewerLoaded extends StateViewer {
  /// Creates instance of [StateViewerLoaded]
  const StateViewerLoaded({
    required this.video,
    required this.videoPlayerController,
  });

  /// The video data
  final ModelVideo video;

  /// The video player controller
  final VideoPlayerController videoPlayerController;
}

/// State class for error Viewer screen
class StateViewerError extends StateViewer {
  /// Creates instance of [StateViewerError]
  const StateViewerError({
    required this.message,
  });

  /// The error message will be displayed
  final String message;
}
