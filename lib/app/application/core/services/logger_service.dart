import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:logging/logging.dart';

abstract class BaseLoggerService {
  static const appName = 'advicer_app';

  @protected
  late Logger _logger;

  @protected
  final DateFormat _dateFormatter = DateFormat('H:m:s.S');

  void log(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger.info(
        message,
        error,
        stackTrace,
      );
}

class LoggerService extends BaseLoggerService {
  static LoggerService? _instance;

  LoggerService._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((_recordHandler));
    _logger = Logger(BaseLoggerService.appName);
    debugPrint('<LoggerService> activate');
    _instance = this;
  }

  factory LoggerService() => _instance ?? LoggerService._internal();

  void _recordHandler(LogRecord rec) {
    debugPrint('${_dateFormatter.format(rec.time)}: ${rec.message}, ${rec.error}');
  }
}

extension ThemeServiceExtension on BuildContext {
  LoggerService get logger => LoggerService();
}
