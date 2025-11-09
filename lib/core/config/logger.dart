import 'dart:developer' as developer;
import 'dart:convert';

class Log {
  Log._();

  // ANSI Colors
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _yellow = '\x1B[33m';
  static const String _green = '\x1B[32m';
  static const String _blue = '\x1B[34m';
  static const String _cyan = '\x1B[36m';
  static const String _gray = '\x1B[90m';
  static const String _white = '\x1B[37m';

  // Icons
  static const String _iconDebug = '🐛';
  static const String _iconInfo = '💡';
  static const String _iconWarning = '⚠️';
  static const String _iconError = '🔴';
  static const String _iconSuccess = '✅';

  static void _log(
    String icon,
    String color,
    String level,
    String message, {
    String? tag,
    Object? data,
    StackTrace? stackTrace,
  }) {
    final timestamp = DateTime.now();
    final timeStr = '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}:'
        '${timestamp.second.toString().padLeft(2, '0')}.'
        '${timestamp.millisecond.toString().padLeft(3, '0')}';

    final buffer = StringBuffer();
    
    // Header line
    buffer.writeln('$_gray╔═════════════════════════════════════════════════════════════════$_reset');
    
    // Icon and Level
    buffer.writeln('$_gray║$_reset $icon  $color$level$_reset');
    
    // Timestamp
    buffer.writeln('$_gray║$_reset $_gray$timeStr (+0:00:00.000000)$_reset');
    
    buffer.writeln('$_gray╠═════════════════════════════════════════════════════════════════$_reset');
    
    // Message
    buffer.writeln('$_gray║$_reset $_white$message$_reset');
    
    // Tag if provided
    if (tag != null) {
      buffer.writeln('$_gray║$_reset');
      buffer.writeln('$_gray║$_reset $_gray#0    ${tag.padRight(40)} package:demo/main.dart:25$_reset');
    }

    // Data if provided
    if (data != null) {
      buffer.writeln('$_gray║$_reset');
      final jsonStr = _prettyJson(data);
      for (var line in jsonStr.split('\n')) {
        buffer.writeln('$_gray║$_reset $_gray$line$_reset');
      }
    }

    // StackTrace if provided
    if (stackTrace != null) {
      buffer.writeln('$_gray║$_reset');
      final traces = stackTrace.toString().split('\n').take(3);
      for (var trace in traces) {
        buffer.writeln('$_gray║$_reset $_gray$trace$_reset');
      }
    }

    // Footer
    buffer.writeln('$_gray╚═════════════════════════════════════════════════════════════════$_reset');

    developer.log(buffer.toString(), name: 'Flutter');
  }

  static String _prettyJson(Object? data) {
    if (data == null) return 'null';
    try {
      const encoder = JsonEncoder.withIndent('  ');
      if (data is Map || data is List) {
        return encoder.convert(data);
      }
      return data.toString();
    } catch (e) {
      return data.toString();
    }
  }

  /// Debug log with 🐛 icon
  static void d(String message, {String? tag, Object? data}) {
    _log(_iconDebug, _blue, 'Debug', message, tag: tag, data: data);
  }

  /// Info log with 💡 icon
  static void i(String message, {String? tag, Object? data}) {
    _log(_iconInfo, _cyan, 'Info', message, tag: tag, data: data);
  }

  /// Warning log with ⚠️ icon
  static void w(String message, {String? tag, Object? data}) {
    _log(_iconWarning, _yellow, 'Warning', message, tag: tag, data: data);
  }

  /// Error log with 🔴 icon
  static void e(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      _iconError,
      _red,
      'Error',
      message,
      tag: tag,
      data: error,
      stackTrace: stackTrace,
    );
  }

  /// Success log with ✅ icon
  static void s(String message, {String? tag, Object? data}) {
    _log(_iconSuccess, _green, 'Success', message, tag: tag, data: data);
  }

  /// Demo function to show all log types
  static void demo() {
    d('This is a debug message');
    
    i('This is an info message');
    
    w('Just a warning!', tag: 'demo');
    
    e(
      'Something bad happened',
      tag: 'demo',
      error: 'Test Error',
    );
    
    s('Operation completed successfully');
    
    // Example with JSON data
    i('User data received', data: {
      'key': 5,
      'value': 'something',
      'nested': {
        'id': 123,
        'name': 'Flutter'
      }
    });
  }
}

