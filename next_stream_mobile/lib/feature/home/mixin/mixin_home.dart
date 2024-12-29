import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/screen_home.dart';
import 'package:next_stream_mobile/feature/home/view_model/cubit_home.dart';
import 'package:next_stream_mobile/feature/upload/dialog_upload.dart';
import 'package:next_stream_mobile/feature/viewer/argument_viewer.dart';
import 'package:next_stream_mobile/product/logger/log.dart';
import 'package:next_stream_mobile/product/network/response/model_video.dart';
import 'package:next_stream_mobile/product/route/app_routes.dart';

/// The mixin for the home screen.
mixin MixinHome on State<ScreenHome> {
  /// The cubit for the home screen.
  CubitHome get cubit => context.read<CubitHome>();

  @override
  void initState() {
    super.initState();
    cubit.loadVideos();
  }

  /// Handles the event when the upload button is pressed.
  Future<void> onUploadPressed() async {
    L.t('Upload button pressed', start: true);

    await DialogUpload.show(context);

    L.t('Upload button pressed', start: false);
  }

  /// Handles the event when a video is pressed.
  void onVideoPressed(ModelVideo video) {
    L.t('Video: ${video.toLogString()}', start: true);

    Navigator.pushNamed(
      context,
      AppRoutes.viewer,
      arguments: ArgumentViewer(videoId: video.id),
    );

    L.t('', start: false);
  }
}
