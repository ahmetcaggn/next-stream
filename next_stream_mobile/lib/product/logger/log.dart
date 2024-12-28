import 'package:next_stream_mobile/product/logger/app_logger.dart';
import 'package:next_stream_mobile/product/logger/enum_log_level.dart';

/// An helper class for logging. It provides the logger instances for each log
/// level. And also, it has a method to log the message with the log level
/// given dynamically.
abstract final class L {
  /// Initializes the logger for the application.
  static void initForApp() {
    t = const AppLogger(tag: EnumLogLevel.trace);
    d = const AppLogger(tag: EnumLogLevel.debug);
    i = const AppLogger(tag: EnumLogLevel.info);
    w = const AppLogger(tag: EnumLogLevel.warn);
    e = const AppLogger(tag: EnumLogLevel.error);
    f = const AppLogger(tag: EnumLogLevel.fatal);

    i('Logger initialized');
  }

  /// Gets the logger instance for the given [level].
  static AppLogger getLogger(EnumLogLevel level) {
    switch (level) {
      case EnumLogLevel.trace:
        return t;
      case EnumLogLevel.debug:
        return d;
      case EnumLogLevel.info:
        return i;
      case EnumLogLevel.warn:
        return w;
      case EnumLogLevel.error:
        return e;
      case EnumLogLevel.fatal:
        return f;
    }
  }

  /// The TRACE logger instance.
  static late final AppLogger t;

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
