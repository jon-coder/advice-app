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

  static const String _redColor = '\u001b[31m';
  static const String _blueColor = '\u001b[34m';
  static const String _yellowColor = '\u001b[33m';
  static const String _resetColor = '\u001b[0m';

  LoggerService._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((_recordHandler));
    _logger = Logger(BaseLoggerService.appName);
    debugPrint('<LoggerService> activate');
    _instance = this;
  }

  factory LoggerService() => _instance ?? LoggerService._internal();

  void _recordHandler(LogRecord rec) {
    debugPrint(
        '$_blueColor${_dateFormatter.format(rec.time)}: $_yellowColor${rec.message}, $_redColor${rec.error},$_resetColor');
  }
}

extension LoggerServiceExtension on BuildContext {
  LoggerService get logger => LoggerService();
}
