// ignore_for_file: avoid_print it is logging library

import 'package:next_stream_mobile/product/logger/app_logger_utils.dart';
import 'package:next_stream_mobile/product/logger/core/enum/log_level.dart';
import 'package:next_stream_mobile/product/logger/core/i_app_logger.dart';

/// A simple logger class to log messages with a tag. Create instances of this
/// for each logging level you want to use.
class AppLogger implements IAppLogger {
  /// Creates a new instance of the [AppLogger] with the given [tag].
  const AppLogger({
    required this.tag,
  });

  @override
  final LogLevel tag;

  @override
  void call(
    String logMessage, {
    int? stackTraceDepth,
    String? callerFunction,
  }) {
    print(
      '${DateTime.now()}'
      ' : '
      '${_right(5, tag.value)}'
      ' : '
      '${_right(32, callerFunction ?? AppLoggerUtils.callerFunction())}'
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
}
