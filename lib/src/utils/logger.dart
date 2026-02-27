import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

enum LogLevel {
  info(32),
  debug(208),
  error(196),
  success(77);

  final int _color;

  const LogLevel(this._color);
}

class MyLog {
  static const ansiEsc = '\x1B[';
  static const ansiDefault = '${ansiEsc}0m';
  static const _encoder = JsonEncoder.withIndent("  ");

  static void info(Object? info) => _print(info, LogLevel.info);

  static void debug(Object? info) => _print(info, LogLevel.debug);

  static void error(Object? error) => _print(error, LogLevel.error);

  static void success(Object? info) => _print(info, LogLevel.success);

  static void _print(Object? object, LogLevel logLevel) {
    try {
      if (object is num || object is String || object is bool) {
        log(object.toString(), logLevel);
      } else {
        _encoder
            .convert(object)
            .split("\n")
            .forEach((element) => log(element, logLevel));
      }
    } catch (_) {
      log(object.toString(), logLevel);
    }
  }

  static void log(String content, [LogLevel logLevel = LogLevel.debug]) {
    if (!kIsWeb && (Platform.isIOS || Platform.isMacOS)) {
      debugPrint(content);
      return;
    }
    debugPrint("${ansiEsc}38;5;${logLevel._color}m$content$ansiDefault");
  }
}

class AppLogger {
  static void d(String tag, String message) {
    if (kDebugMode) {
      MyLog.debug('[$tag] $message');
    }
  }

  static void e(String tag, String message) {
    if (kDebugMode) {
      MyLog.error('[$tag] $message');
    }
  }
}
