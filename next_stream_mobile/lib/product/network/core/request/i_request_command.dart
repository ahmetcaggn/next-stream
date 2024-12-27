import 'package:next_stream_mobile/product/network/core/request/enum_http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// Interface for all requests types to the api.
abstract interface class IRequestCommand<T extends IResponseModel> {
  /// The path of the request.
  String get path;

  /// The method of the request. GET, POST, PUT, DELETE, etc.
  EnumHttpRequestMethod get method;

  /// The payload data of the request. Applicable in the form of Json or form
  /// data.
  Map<String, dynamic> get data;

  /// The headers of the request.
  Map<String, dynamic> get headers;

  /// The sample model to deserialize the response via its fromJson function.
  T get sampleModel;
}
