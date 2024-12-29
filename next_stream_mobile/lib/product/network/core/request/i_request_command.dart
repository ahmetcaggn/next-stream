import 'package:next_stream_mobile/product/network/core/request/http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/request/request_payload_type.dart';
import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// The callback for the progress of the request.
typedef OnProgressCallback = void Function(int done, int total);

/// Interface for all requests types to the api.
abstract interface class IRequestCommand<T extends IResponseModel> {
  /// The path of the request.
  String get path;

  /// The method of the request. GET, POST, PUT, DELETE, etc.
  HttpRequestMethod get method;

  /// The type of the payload. Json, form data, etc.
  RequestPayloadType get payloadType;

  /// The payload data of the request. Applicable in the form of Json or form
  /// data.
  Map<String, dynamic> get data;

  /// The headers of the request.
  Map<String, dynamic> get headers;

  /// The callback for the progress of the request.
  OnProgressCallback? get onSendProgressUpdate;

  /// The callback for the progress of the response.
  OnProgressCallback? get onReceiveProgressUpdate;

  /// The sample model to deserialize the response via its fromJson function.
  T get sampleModel;

  /// Converts the instance to a loggable string.
  String toLogString();
}
