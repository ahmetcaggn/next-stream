import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/upload/dialog_upload.dart';
import 'package:next_stream_mobile/feature/upload/view_model/cubit_upload.dart';
import 'package:next_stream_mobile/feature/upload/view_model/event_upload.dart';
import 'package:next_stream_mobile/feature/upload/view_model/state_upload.dart';
import 'package:next_stream_mobile/product/logger/log.dart';

/// The mixin for the upload screen
mixin MixinUpload on State<DialogUpload> {
  /// The cubit for the upload screen
  CubitUpload get cubit => context.read<CubitUpload>();

  /// The controller for the title text field in the dialog
  final TextEditingController titleController = TextEditingController();

  /// The controller for the description text field in the dialog
  final TextEditingController descriptionController = TextEditingController();

  /// Trigger when pressing the pick file button
  Future<void> pickFile() async {
    L.t('', start: true);

    await cubit.pickFile();

    L.t('', start: false);
  }

  /// Trigger when pressing the upload button
  Future<void> uploadFile() async {
    L.t('', start: true);

    final state = cubit.state;
    if (state is! StateUploadFilePicked) {
      L.e('No file picked when uploading video');
      return;
    }

    final title = titleController.text;
    final description = descriptionController.text;
    final filePath = state.file.path;

    await cubit.uploadVideo(
      EventUploadVideo(
        title: title,
        description: description,
        filePath: filePath,
      ),
    );

    L.t('Uploading video: $title, $filePath', start: false);
  }
}
