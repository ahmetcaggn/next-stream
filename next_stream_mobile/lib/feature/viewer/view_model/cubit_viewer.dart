import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/viewer/view_model/state_viewer.dart';
import 'package:next_stream_mobile/product/dependency_injection/get.dart';
import 'package:next_stream_mobile/product/logger/log.dart';
import 'package:next_stream_mobile/product/network/core/api_endpoints.dart';
import 'package:next_stream_mobile/product/network/core/i_network_manager.dart';
import 'package:next_stream_mobile/product/network/request/request_get_video.dart';
import 'package:video_player/video_player.dart';

/// The cubit for the Viewer screen
class CubitViewer extends Cubit<StateViewer> {
  /// Creates instance of [CubitViewer]
  CubitViewer({
    INetworkManager? networkManager,
  }) : super(const StateViewerInitial()) {
    _nm = networkManager ?? G.networkManager;
  }

  late final INetworkManager _nm;

  /// Loads the video with the given [videoId]
  Future<void> loadVideo(int videoId) async {
    L.t('', start: true);

    await runZonedGuarded(
      () async {
        await _loadVideo(videoId);
      },
      (Object error, StackTrace stackTrace) {
        L.e('', error: error, stackTrace: stackTrace);
        emit(StateViewerError(message: error.toString()));
      },
    );

    L.t('', start: false);
  }

  Future<void> _loadVideo(int videoId) async {
    final response = await _nm.request(RequestGetVideo(videoId: videoId));

    if (!response.isSuccess) {
      final errorMessage = response.asError.message;
      emit(StateViewerError(message: errorMessage));
      return;
    }

    final video = response.asSuccess.data;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.file(video.fileName)}',
      ),
    );
    await controller.initialize();
    emit(StateViewerLoaded(
      video: video,
      videoPlayerController: controller,
    ));
  }

  @override
  Future<void> close() async {
    L.t('', start: true);

    if (state is StateViewerLoaded) {
      final stateLoaded = state as StateViewerLoaded;
      await stateLoaded.videoPlayerController.dispose();
    }
    emit(const StateViewerInitial());

    await super.close();
    L.t('', start: false);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    L.e('', error: error, stackTrace: stackTrace);
    emit(StateViewerError(message: error.toString()));
  }
}
