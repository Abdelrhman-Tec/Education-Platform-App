import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle titleLargeBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle titleMediumBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle titleSmallBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle titleLargeSemiBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle titleMediumSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle titleSmallSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle bodyLargeNormal = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
    height: 1.5,
  );

  static TextStyle bodyMediumNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
    height: 1.4,
  );

  static TextStyle bodySmallNormal = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
    height: 1.3,
  );

  static TextStyle bodyLargeLight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle bodyMediumLight = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );

  static TextStyle bodySmallLight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    fontFamily: 'NotoKufi',
  );
}
