/// Enum for log level that can be used in the logger of the application.
enum LogLevel {
  /// Trace log level. Used for logging at the start and end of functions.
  trace,

  /// Debug log level. Used for logging detailed information.
  debug,

  /// Info log level. Used for logging general information. (e.g.
  /// initializations)
  info,

  /// Warn log level. Used for logging warnings.
  warn,

  /// Error log level. Used for logging errors that should not occur.
  error,

  /// Fatal log level. Used for logging errors that cannot be recovered from.
  fatal,
  ;

  /// Get the value of the enum.
  String get value {
    switch (this) {
      case LogLevel.trace:
        return 'TRACE';
      case LogLevel.debug:
        return 'DEBUG';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.warn:
        return 'WARN';
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.fatal:
        return 'FATAL';
    }
  }
}
