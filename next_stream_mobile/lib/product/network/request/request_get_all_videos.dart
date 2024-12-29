import 'package:next_stream_mobile/product/network/core/api_endpoints.dart';
import 'package:next_stream_mobile/product/network/core/request/http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
import 'package:next_stream_mobile/product/network/core/request/request_payload_type.dart';
import 'package:next_stream_mobile/product/network/response/model_list_video.dart';

/// The request command for getting all videos.
final class RequestGetAllVideos implements IRequestCommand<ModelListVideo> {
  /// Creates instance of [RequestGetAllVideos]
  const RequestGetAllVideos();

  /// Creates instance of [RequestGetAllVideos] with empty data.
  const RequestGetAllVideos.empty();

  @override
  RequestPayloadType get payloadType => RequestPayloadType.json;

  @override
  Map<String, dynamic> get data => const {};

  @override
  Map<String, dynamic> get headers => const {};

  @override
  HttpRequestMethod get method => HttpRequestMethod.get;

  @override
  String get path => ApiEndpoints.videos;

  @override
  OnProgressCallback? get onReceiveProgressUpdate => null;

  @override
  OnProgressCallback? get onSendProgressUpdate => null;

  @override
  ModelListVideo get sampleModel => ModelListVideo.sample;

  @override
  String toLogString() {
    return 'RequestGetAllVideos{'
        'path: $path, '
        'method: $method'
        '}';
  }
}
