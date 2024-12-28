import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/screen_home.dart';
import 'package:next_stream_mobile/feature/home/view_model/cubit_home.dart';
import 'package:next_stream_mobile/product/logger/log.dart';
import 'package:next_stream_mobile/product/network/response/model_video.dart';
import 'package:next_stream_mobile/product/route/app_routes.dart';

/// The mixin for the home screen.
mixin HomeMixin on State<ScreenHome> {
  /// The cubit for the home screen.
  CubitHome get cubit => context.read<CubitHome>();

  @override
  void initState() {
    super.initState();
    cubit.loadVideos();
  }

  /// Handles the event when the upload button is pressed.
  void onUploadPressed() {
    L.t('Upload button pressed');
  }

  /// Handles the event when a video is pressed.
  void onVideoPressed(ModelVideo video) {
    L.t('Video pressed: ${video.logString()}');

    Navigator.pushNamed(context, AppRoutes.viewer);
  }
}
