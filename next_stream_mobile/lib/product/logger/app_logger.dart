// ignore_for_file: avoid_print it is logging library

import 'package:next_stream_mobile/product/logger/log_level.dart';

/// A simple logger class to log messages with a tag. Create instances of this
/// for each logging level you want to use.
class AppLogger {
  /// Creates a new instance of the [AppLogger] with the given [tag].
  const AppLogger({
    required this.tag,
  });

  /// The tag of the log will be logged with this object.
  final LogLevel tag;

  /// Logs the given [logMessage] with the tag of this object.
  ///
  /// If [stackTraceDepth] is provided, it will print the stack trace of the
  /// current call with the given depth. The default value is `null`.
  /// If the value is `null`, it will not print the stack trace.
  void call(
    String logMessage, {
    int? stackTraceDepth,
  }) {
    print(
      '${DateTime.now()}'
      ' : '
      '${_right(5, tag.value)}'
      ' : '
      '${_right(32, _callerFunction)}'
      ' : '
      '$logMessage'
      '${stackTraceDepth != null ? '\n${StackTrace.current}' : ''}',
    );

    if (stackTraceDepth != null) {
      final frames = StackTrace.current.toString().split('\n');
      if (frames.length > stackTraceDepth) {
        for (var i = 0; i < stackTraceDepth; i++) {
          print('  ${frames[i]}');
        }
      }
    }
  }

  String _right(int width, String text) {
    if (text.length >= width) {
      return text;
    }
    return ' ' * (width - text.length) + text;
  }

  String get _callerFunction {
    const dept = 2;
    final frames = StackTrace.current.toString().split('\n');
    if (frames.length > dept) {
      final callerFrame = frames[dept];
      final match = RegExp(r'#\d+\s+(.+)\s+\(.+\)').firstMatch(callerFrame);
      final result = match?.group(1);
      if (result != null) return result;
    }
    return 'Unknown caller';
  }
}
