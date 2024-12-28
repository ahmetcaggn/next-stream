import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:next_stream_mobile/product/logger/core/enum/log_level.dart';
import 'package:next_stream_mobile/product/logger/log.dart';
import 'package:next_stream_mobile/product/network/core/i_network_manager.dart';
import 'package:next_stream_mobile/product/network/core/request/i_request_command.dart';
import 'package:next_stream_mobile/product/network/core/response/app_response_result.dart';
import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// The network manager class for managing to api communication.
final class NetworkManager implements INetworkManager {
  /// defined as a late variable to be initialized in the [init] function.
  late final Dio _dio;

  @override
  Future<void> init({
    String? baseUrl,
  }) async {
    baseUrl ??= 'http://localhost:8080';

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      validateStatus: (status) => true,
      responseType: ResponseType.plain,
    ));

    L.i('NetworkManager initialized with baseUrl: $baseUrl');
  }

  @override
  Future<AppResponseResult<T>> request<T extends IResponseModel>(
      IRequestCommand<T> request) async {
    L.t('Request: ${request.toLogString()}', start: true);

    final response = await _request(request);

    L.t('Response: ${response.toLogString()}', start: false);

    return response;
  }

  Future<AppResponseResult<T>> _request<T extends IResponseModel>(
      IRequestCommand<T> request) async {
    late final Response<dynamic> response;
    try {
      response = await _dio.request<dynamic>(
        request.path,
        data: request.data.isEmpty ? null : request.data,
        options: Options(
          method: request.method.value,
          headers: request.headers,
        ),
      );
    } on Exception catch (e) {
      return AppResponseResultError(
        message: 'Request failed: $e',
      );
    }

    final responseData = response.data;
    final statusCode = response.statusCode;

    if (responseData == null) {
      return AppResponseResultError(
        message: 'Response data is null',
        statusCode: statusCode,
      );
    }
    if (statusCode == null) {
      return AppResponseResultError(
        message: 'Response code is null',
        statusCode: statusCode,
      );
    }
    if (responseData is! String) {
      return AppResponseResultError(
        message: 'Invalid response type. Response data is not String.'
            '\nResponse data: <${responseData.runtimeType}> [$statusCode]'
            '\n$responseData',
        statusCode: statusCode,
      );
    }
    if (statusCode < 200 || statusCode >= 300) {
      return AppResponseResultError(
        message: 'Response status is not successful.'
            '\nResponse data: <${responseData.runtimeType}> [$statusCode]'
            '\n$responseData',
        statusCode: statusCode,
        logLevel: LogLevel.warn,
      );
    }

    final json = jsonDecode(responseData);
    final dataDynamic = request.sampleModel.fromJson(json);

    late final T data;
    try {
      data = dataDynamic as T;
      return AppResponseResultSuccess(
        data,
        statusCode: statusCode,
      );
    } on Exception catch (e) {
      return AppResponseResultError(
        message: 'Failed to parse response: $e',
        statusCode: statusCode,
      );
    }
  }
}
