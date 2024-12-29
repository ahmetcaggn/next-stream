import 'package:next_stream_mobile/product/logger/app_logger_utils.dart';
import 'package:next_stream_mobile/product/logger/core/i_app_logger.dart';
import 'package:next_stream_mobile/product/logger/impl/app_logger.dart';

/// A logger implementation for logging the trace level logs.
class AppErrorLogger extends AppLogger implements IAppLogger {
  /// Initializes the logger with the given [tag].
  const AppErrorLogger({required super.tag});

  @override
  void call(
    String logMessage, {
    int? stackTraceDepth,
    String? callerFunction,
    Object? error,
    StackTrace? stackTrace,
  }) {
    error ??= 'No error object provided';
    stackTrace ??= StackTrace.current;
    final message = '$logMessage\n$error\n$stackTrace';
    super.call(
      message,
      stackTraceDepth: stackTraceDepth,
      callerFunction: callerFunction ?? AppLoggerUtils.callerFunction(),
    );
  }
}
