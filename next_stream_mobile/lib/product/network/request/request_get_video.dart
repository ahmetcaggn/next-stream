import 'package:next_stream_mobile/product/network/core/api_endpoints.dart';
import 'package:next_stream_mobile/product/network/core/request/http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
import 'package:next_stream_mobile/product/network/core/request/request_payload_type.dart';
import 'package:next_stream_mobile/product/network/response/model_video.dart';

/// The request command for getting a video by its id.
class RequestGetVideo implements IRequestCommand<ModelVideo> {
  /// Creates instance of [RequestGetVideo]
  const RequestGetVideo({
    required this.videoId,
  });

  /// Creates instance of [RequestGetVideo] with empty data.
  const RequestGetVideo.empty() : videoId = 0;

  /// The id of the video to fetch.
  final int videoId;

  @override
  RequestPayloadType get payloadType => RequestPayloadType.json;

  @override
  Map<String, dynamic> get data => const {};

  @override
  Map<String, dynamic> get headers => const {};

  @override
  HttpRequestMethod get method => HttpRequestMethod.get;

  @override
  String get path => ApiEndpoints.video(videoId);

  @override
  OnProgressCallback? get onReceiveProgressUpdate => null;

  @override
  OnProgressCallback? get onSendProgressUpdate => null;

  @override
  ModelVideo get sampleModel => ModelVideo.sample;

  @override
  String toLogString() {
    return 'RequestGetVideo{'
        'path: $path, '
        'method: $method'
        '}';
  }
}
