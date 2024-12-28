import 'package:next_stream_mobile/product/logger/core/enum/log_level.dart';

/// An interface for the logger.
abstract interface class IAppLogger {
  /// The tag of the log will be logged with this object.
  LogLevel get tag;

  /// Logs the given [logMessage] with the tag of this object.
  ///
  /// If [stackTraceDepth] is provided, it will print the stack trace of the
  /// current call with the given depth. The default value is `null`.
  /// If the value is `null`, it will not print the stack trace.
  void call(
    String logMessage, {
    int? stackTraceDepth,
    String? callerFunction,
  });
}
