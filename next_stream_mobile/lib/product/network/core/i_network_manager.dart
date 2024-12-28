import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
import 'package:next_stream_mobile/product/network/core/response/app_response_result.dart';
import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// The interface for the network manager. Implementations should be able to
/// provide the initialization function and the request function that sends
/// requests to the api.
abstract interface class INetworkManager {
  /// Initializes the network manager.
  Future<void> init({
    String? baseUrl,
  });

  /// Sends a request to the api. The request properties are defined in the
  /// [request] parameter in type of [IRequestCommand] interface.
  Future<AppResponseResult<T>> request<T extends IResponseModel>(
      IRequestCommand<T> request);
}
