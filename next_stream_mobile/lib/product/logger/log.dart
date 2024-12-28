import 'package:next_stream_mobile/product/logger/core/enum/log_level.dart';
import 'package:next_stream_mobile/product/logger/impl/app_logger.dart';
import 'package:next_stream_mobile/product/logger/impl/app_trace_logger.dart';

/// An helper class for logging. It provides the logger instances for each log
/// level. And also, it has a method to log the message with the log level
/// given dynamically.
abstract final class L {
  /// Initializes the logger for the application.
  static void initForApp() {
    t = const AppTraceLogger(tag: LogLevel.trace);
    d = const AppLogger(tag: LogLevel.debug);
    i = const AppLogger(tag: LogLevel.info);
    w = const AppLogger(tag: LogLevel.warn);
    e = const AppLogger(tag: LogLevel.error);
    f = const AppLogger(tag: LogLevel.fatal);

    i('Logger initialized');
  }

  /// Gets the logger instance for the given [level].
  static AppLogger getLogger(LogLevel level) {
    switch (level) {
      case LogLevel.trace:
        return t;
      case LogLevel.debug:
        return d;
      case LogLevel.info:
        return i;
      case LogLevel.warn:
        return w;
      case LogLevel.error:
        return e;
      case LogLevel.fatal:
        return f;
    }
  }

  /// The TRACE logger instance.
  static late final AppTraceLogger t;

  /// The DEBUG logger instance.
  static late final AppLogger d;

  /// The INFO logger instance.
  static late final AppLogger i;

  /// The WARN logger instance.
  static late final AppLogger w;

  /// The ERROR logger instance.
  static late final AppLogger e;

  /// The FATAL logger instance.
  static late final AppLogger f;
}
