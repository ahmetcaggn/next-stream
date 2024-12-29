import 'package:dio/dio.dart';
import 'package:next_stream_mobile/product/network/core/api_endpoints.dart';
import 'package:next_stream_mobile/product/network/core/request/http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
import 'package:next_stream_mobile/product/network/core/request/request_payload_type.dart';
import 'package:next_stream_mobile/product/network/response/model_video.dart';

/// The request command for posting a video.
class RequestPostVideo implements IRequestCommand<ModelVideo> {
  /// Creates the request command with the given [title], [description], and
  /// [file].
  const RequestPostVideo({
    required this.title,
    required this.description,
    required this.file,
    this.onSendProgressUpdate,
  });

  /// The title of the video.
  final String title;

  /// The description of the video.
  final String description;

  /// The file of the video. must be a video file.
  final MultipartFile file;

  @override
  final OnProgressCallback? onSendProgressUpdate;

  @override
  RequestPayloadType get payloadType => RequestPayloadType.formData;

  @override
  Map<String, dynamic> get data => {
        'title': title,
        'description': description,
        'file': file,
      };

  @override
  Map<String, dynamic> get headers => const {};

  @override
  HttpRequestMethod get method => HttpRequestMethod.post;

  @override
  String get path => ApiEndpoints.createVideo;

  @override
  OnProgressCallback? get onReceiveProgressUpdate => null;

  @override
  ModelVideo get sampleModel => ModelVideo.sample;

  @override
  String toLogString() {
    return 'RequestPostVideo{'
        'title: $title, '
        'description: $description, '
        'file: ${file.filename}'
        '}';
  }
}
