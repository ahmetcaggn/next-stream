import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/viewer/screen_viewer.dart';
import 'package:next_stream_mobile/feature/viewer/view_model/cubit_viewer.dart';

/// The mixin for the viewer screen.
mixin MixinViewer on State<ScreenViewer> {
  /// The cubit for the viewer screen.
  CubitViewer get cubit => context.read<CubitViewer>();

  @override
  void initState() {
    super.initState();
    cubit.loadVideo(widget.argument.videoId);
  }
}
