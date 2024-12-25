import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/screen_home.dart';
import 'package:next_stream_mobile/feature/home/view_model/cubit_home.dart';

/// The mixin for the home screen.
mixin HomeMixin on State<ScreenHome> {
  /// The cubit for the home screen.
  CubitHome get cubit => context.read<CubitHome>();

  /// Handles the event when the upload button is pressed.
  void onUploadPressed() {}
}
