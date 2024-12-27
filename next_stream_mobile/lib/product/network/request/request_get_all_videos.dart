import 'package:next_stream_mobile/product/network/core/api_endpoints.dart';
import 'package:next_stream_mobile/product/network/core/request/enum_http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
import 'package:next_stream_mobile/product/network/response/model_list_video.dart';

/// The request command for getting all videos.
final class RequestGetAllVideos implements IRequestCommand<ModelListVideo> {
  /// Creates instance of [RequestGetAllVideos]
  const RequestGetAllVideos();

  /// Creates instance of [RequestGetAllVideos] with empty data.
  const RequestGetAllVideos.empty();

  static const _sampleModel = ModelListVideo.empty();

  @override
  Map<String, dynamic> get data => {};

  @override
  Map<String, dynamic> get headers => {};

  @override
  EnumHttpRequestMethod get method => EnumHttpRequestMethod.get;

  @override
  String get path => ApiEndpoints.videos;

  @override
  ModelListVideo get sampleModel => _sampleModel;
}
