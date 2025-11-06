import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle titleLargeBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle titleMediumBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle titleSmallBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle titleLargeSemiBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle titleMediumSemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle titleSmallSemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle bodyLargeNormal = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
    height: 1.5,
  );

  static const TextStyle bodyMediumNormal = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
    height: 1.4,
  );

  static const TextStyle bodySmallNormal = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
    height: 1.3,
  );

  static const TextStyle bodyLargeLight = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle bodyMediumLight = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle bodySmallLight = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle captionLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle captionMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle captionSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle courseTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle courseInstructor = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle courseStats = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle priceLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.discountPrice,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle priceMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.discountPrice,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle priceSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.discountPrice,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle originalPriceLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.originalPrice,
    fontFamily: 'NotoKufi',
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle originalPriceMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.originalPrice,
    fontFamily: 'NotoKufi',
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle originalPriceSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.originalPrice,
    fontFamily: 'NotoKufi',
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle discountBadge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle bottomNavSelected = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.bottomNavSelected,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle bottomNavUnselected = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.bottomNavUnselected,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle searchHint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle profileName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle profileEmail = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle profileSection = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle certificateTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle certificateSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: 'NotoKufi',
  );

  static const TextStyle rating = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'NotoKufi',
  );
}
