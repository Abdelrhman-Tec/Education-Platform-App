import 'package:flutter/material.dart';

/// Extension on BuildContext — for navigation, theming, and screen info
extension ContextX on BuildContext {
  // Navigation helpers
  void push(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  void pushReplacement(Widget page) => Navigator.of(
    this,
  ).pushReplacement(MaterialPageRoute(builder: (_) => page));

  void pop([dynamic result]) => Navigator.of(this).pop(result);

  // Access theme, text styles, and colors
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  // Screen size helpers
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;

  // Theme and direction info
  bool get isDark => theme.brightness == Brightness.dark;
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
}

/// Extension on String — for text formatting and validation
extension StringX on String {
  // Capitalize the first letter
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  // Remove extra spaces
  String get clean => replaceAll(RegExp(r'\s+'), ' ').trim();

  // Validate email format
  bool get isEmail => RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(this);

  // Validate URL format
  bool get isUrl => Uri.tryParse(this)?.hasAbsolutePath ?? false;

  // Convert to number if possible
  num? get toNum => num.tryParse(this);
}

/// Extension on DateTime — for readable formatting
extension DateTimeX on DateTime {
  // Short date format: dd/MM/yyyy
  String get shortDate =>
      "${day.toString().padLeft(2, '0')}/"
      "${month.toString().padLeft(2, '0')}/$year";

  // Formatted time: HH:mm
  String get formattedTime =>
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";

  // Human-readable time difference
  String get timeAgo {
    final diff = DateTime.now().difference(this);
    if (diff.inDays > 0) return '${diff.inDays} day(s) ago';
    if (diff.inHours > 0) return '${diff.inHours} hour(s) ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes} minute(s) ago';
    return 'Just now';
  }
}

/// Extension on Widget — for adding padding, margin, and visibility
extension WidgetX on Widget {
  // Add padding around a widget
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  // Add symmetric padding
  Widget paddingSymmetric({double h = 0, double v = 0}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
    child: this,
  );

  // Add margin around a widget
  Widget marginAll(double value) =>
      Container(margin: EdgeInsets.all(value), child: this);

  // Add symmetric margin
  Widget marginSymmetric({double h = 0, double v = 0}) => Container(
    margin: EdgeInsets.symmetric(horizontal: h, vertical: v),
    child: this,
  );

  // Hide widget if condition is false
  Widget visible(bool condition) => condition ? this : const SizedBox.shrink();
}
