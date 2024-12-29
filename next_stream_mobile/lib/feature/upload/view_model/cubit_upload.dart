import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_stream_mobile/feature/upload/view_model/event_upload.dart';
import 'package:next_stream_mobile/feature/upload/view_model/state_upload.dart';
import 'package:next_stream_mobile/product/dependency_injection/get.dart';
import 'package:next_stream_mobile/product/logger/log.dart';
import 'package:next_stream_mobile/product/network/core/i_network_manager.dart';
import 'package:next_stream_mobile/product/network/request/request_post_video.dart';

/// The cubit for the Upload screen
class CubitUpload extends Cubit<StateUpload> {
  /// Creates instance of [CubitUpload]
  CubitUpload({
    INetworkManager? networkManager,
  }) : super(const StateUploadInitial()) {
    _nm = networkManager ?? G.networkManager;
  }

  late final INetworkManager _nm;

  /// Picks a file from the gallery.
  Future<void> pickFile() async {
    L.t('', start: true);

    final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (file == null) {
      L.t('cancelled', start: false);
      return;
    }

    emit(StateUploadFilePicked(file: file));

    L.t('', start: false);
  }

  /// Uploads a video with the given [event].
  Future<void> uploadVideo(EventUploadVideo event) async {
    L.t('Uploading video: ${event.title}, ${event.filePath}', start: true);

    if (state is! StateUploadFilePicked) {
      L.e('No file picked when uploading video');
      emit(const StateUploadError(message: 'No file picked'));
      return;
    }

    emit(const StateUploadInProgress(progress: 0));

    await _uploadVideo(event);

    L.t('Uploading video: ${event.title}, ${event.filePath}', start: false);
  }

  Future<void> _uploadVideo(EventUploadVideo event) async {
    final file = await MultipartFile.fromFile(event.filePath);

    final response = await _nm.request(RequestPostVideo(
      title: event.title,
      description: event.description,
      file: file,
      onSendProgressUpdate: (sent, total) {
        emit(StateUploadInProgress(progress: sent / total));
      },
    ));

    if (!response.isSuccess) {
      emit(StateUploadError(message: response.asError.message));
      return;
    }

    final data = response.asSuccess.data;
    L.d('Video uploaded: $data');

    emit(const StateUploadSuccess());
  }
}
