import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
import 'package:next_stream_mobile/product/network/core/response/app_response_result.dart';
import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// The network manager class for managing to api communication.
final class NetworkManager {
  late final Dio _dio;

  /// Initializes the network manager.
  Future<void> init({
    String? baseUrl,
  }) async {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl ?? 'http://localhost',
      validateStatus: (status) => true,
    ));
  }

  /// Sends a request to the api. The request properties are defined in the
  /// [request] parameter in type of [IRequestCommand] interface.
  Future<AppResponseResult<T>> request<T extends IResponseModel>(
      IRequestCommand<T> request) async {
    final response = await _dio.request<dynamic>(
      request.path,
      data: request.data.isEmpty ? null : request.data,
      options: Options(
        method: request.method.value,
        headers: request.headers,
      ),
    );

    final responseData = response.data;
    final statusCode = response.statusCode;

    if (responseData == null) {
      return AppResponseResultError(message: 'Response data is null');
    }
    if (statusCode == null) {
      return AppResponseResultError(message: 'Response code is null');
    }
    if (responseData is! String) {
      return AppResponseResultError(
          message: 'Invalid response type. Response data is not String.');
    }
    if (statusCode < 200 || statusCode >= 300) {
      return AppResponseResultError(
        message: 'Response status is not success: $responseData',
        statusCode: statusCode,
      );
    }

    final json = jsonDecode(responseData);
    final data = request.sampleModel.fromJson(json) as T;
    return AppResponseResultSuccess(
      data,
      statusCode: statusCode,
    );
  }
}
