import 'package:next_stream_mobile/product/network/core/api_endpoints.dart';
import 'package:next_stream_mobile/product/network/core/request/enum_http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
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

  static ModelVideo? _sampleModel;

  @override
  Map<String, dynamic> get data => {};

  @override
  Map<String, dynamic> get headers => {};

  @override
  EnumHttpRequestMethod get method => EnumHttpRequestMethod.get;

  @override
  String get path => ApiEndpoints.video(videoId);

  @override
  ModelVideo get sampleModel => _sampleModel ??= ModelVideo.empty();
}
