import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomSnackbar(
  BuildContext context, {
  required String message,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
  Duration duration = const Duration(seconds: 3),
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: textColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    duration: duration,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
