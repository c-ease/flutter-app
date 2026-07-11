import 'package:logger/logger.dart';
import 'package:quote/core/logging/log_tag.dart';

class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 100,
      colors: true,
      printEmojis: false,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void debug(
    String message, {
    required AppLogTag tag,
  }) {
    _logger.d('[${tag.name.toUpperCase()}] $message');
  }

  static void info(
    String message, {
    required AppLogTag tag,
  }) {
    _logger.i('[${tag.name.toUpperCase()}] $message');
  }

  static void warning(
    String message, {
    required AppLogTag tag,
  }) {
    _logger.w('[${tag.name.toUpperCase()}] $message');
  }

  static void error(
    String message, {
    required AppLogTag tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(
      '[${tag.name.toUpperCase()}] $message',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void verbose(
    String message, {
    required AppLogTag tag,
  }) {
    _logger.t('[${tag.name.toUpperCase()}] $message');
  }
}