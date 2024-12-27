import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// The base class of classes the network manager provides by default.
sealed class AppResponseResult<T extends IResponseModel> {
  const AppResponseResult();

  /// The status code of the response.
  int? get statusCode;

  /// If the instance is a success response.
  bool get isSuccess => this is AppResponseResultSuccess<T>;

  /// Get the instance as [AppResponseResultSuccess] only if it is a success.
  /// Otherwise, it will throw an exception.
  AppResponseResultSuccess<T> get asSuccess {
    assert(isSuccess, 'The response is not a success response.');
    return this as AppResponseResultSuccess<T>;
  }

  /// If the instance is an error response, otherwise it will throw an
  /// exception.
  AppResponseResultError<T> get asError {
    assert(!isSuccess, 'The response is not an error response.');
    return this as AppResponseResultError<T>;
  }
}

/// The standard success response from the network manager.
final class AppResponseResultSuccess<T extends IResponseModel>
    extends AppResponseResult<T> {
  /// Creates instance of [AppResponseResultSuccess]
  const AppResponseResultSuccess(
    this.data, {
    this.statusCode = 200,
  });

  /// The data of the response if it is successful.
  final T data;

  @override
  final int statusCode;
}

/// The standard error response from the network manager.
final class AppResponseResultError<T extends IResponseModel>
    extends AppResponseResult<T> {
  /// Creates instance of [AppResponseResultError]
  AppResponseResultError({
    required this.message,
    this.statusCode,
  });

  /// The error message of the response if it is failed.
  final String message;

  @override
  final int? statusCode;
}
