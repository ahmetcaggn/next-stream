import 'package:next_stream_mobile/product/logger/app_logger_utils.dart';
import 'package:next_stream_mobile/product/logger/core/i_app_logger.dart';
import 'package:next_stream_mobile/product/logger/impl/app_logger.dart';

/// A logger implementation for logging the trace level logs.
class AppTraceLogger extends AppLogger implements IAppLogger {
  /// Initializes the logger with the given [tag].
  const AppTraceLogger({required super.tag});

  @override
  void call(
    String logMessage, {
    int? stackTraceDepth,
    String? callerFunction,
    bool? start,
  }) {
    assert(start != null, 'start should not be null for AppTraceLogger');
    final message = start == null
        ? logMessage
        : start
            ? 'START: $logMessage'
            : 'END  : $logMessage';
    super.call(
      message,
      stackTraceDepth: stackTraceDepth,
      callerFunction: callerFunction ?? AppLoggerUtils.callerFunction(),
    );
  }
}
