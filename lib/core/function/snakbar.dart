import 'package:education_platform_app/core/routing/index.dart';

import 'package:flutter_animate/flutter_animate.dart';

void showCustomSnackbar(
  BuildContext context, {
  required String message,
  Color textColor = Colors.white,
  Color backgroundColor = AppColors.mediumBlue,
  Duration duration = const Duration(seconds: 3),
}) {
  final snackBar = SnackBar(
    content:
        Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            )
            // إضافة animation
            .animate()
            .fade(duration: 300.ms)
            .slideY(begin: -0.5, end: 0, curve: Curves.easeOut),

    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    duration: duration,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
