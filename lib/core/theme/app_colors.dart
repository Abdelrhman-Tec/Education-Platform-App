import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF000000);
  static const Color primaryDark = Color(0xFF000000);
  static const Color primaryLight = Color(0xFF333333);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Accent & Secondary Colors
  static const Color accent = Color(0xFF007AFF);
  static const Color secondary = Color(0xFF007AFF);
  static const Color secondaryLight = Color(0xFF4DA3FF);

  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);
  static const Color textHint = Color(0xFFBBBBBB);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Price & Discount Colors
  static const Color originalPrice = Color(0xFF888888);
  static const Color discountPrice = Color(0xFF000000);
  static const Color discountBadge = Color(0xFFFF0000);
  static const Color salePrice = Color(0xFF000000);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF007AFF);
  static const Color buttonSecondary = Color(0xFFF5F5F5);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color buttonDisabled = Color(0xFFCCCCCC);

  // Border & Divider Colors
  static const Color border = Color(0xFFDDDDDD);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color outline = Color(0xFFDDDDDD);

  // Icon Colors
  static const Color iconPrimary = Color(0xFF000000);
  static const Color iconSecondary = Color(0xFF666666);
  static const Color iconAccent = Color(0xFF007AFF);

  // Status Colors
  static const Color success = Color(0xFF00C853);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFFF0000);
  static const Color info = Color(0xFF2196F3);

  // Category & Tag Colors
  static const Color categoryBackground = Color(0xFFF5F5F5);
  static const Color tagBackground = Color(0xFFF8F8F8);
  static const Color chipBackground = Color(0xFFF5F5F5);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0A000000);

  // Course Card Colors
  static const Color courseCardShadow = Color(0x1A000000);
  static const Color courseCardBackground = Color(0xFFFFFFFF);
  static const Color courseRating = Color(0xFFFFA000);

  // Navigation & Bottom Bar
  static const Color navigationBar = Color(0xFFFFFFFF);
  static const Color bottomNavBar = Color(0xFFFFFFFF);
  static const Color bottomNavSelected = Color(0xFF007AFF);
  static const Color bottomNavUnselected = Color(0xFF666666);

  // Cart & Purchase Colors
  static const Color cartIcon = Color(0xFF007AFF);
  static const Color cartBadge = Color(0xFFFF0000);
  static const Color purchaseButton = Color(0xFF007AFF);

  // Profile & Settings
  static const Color profileSection = Color(0xFFF8F8F8);
  static const Color settingsItem = Color(0xFFF8F8F8);

  // Certificate Colors
  static const Color certificateBackground = Color(0xFFF8F8F8);
  static const Color certificateBorder = Color(0xFFDDDDDD);

  // Search & Filter
  static const Color searchBackground = Color(0xFFF5F5F5);
  static const Color searchBorder = Color(0xFFDDDDDD);
  static const Color filterChip = Color(0xFFF5F5F5);

  // Gradient Colors (if needed)
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF007AFF), Color(0xFF4DA3FF)],
  );

  // Semantic Colors
  static const Color semanticWarning = Color(0xFFFFA000);
  static const Color semanticSuccess = Color(0xFF00C853);
  static const Color semanticError = Color(0xFFFF0000);
  static const Color semanticInfo = Color(0xFF007AFF);
}

// Extension for easy access in Flutter
extension AppColorsExtension on AppColors {
  static Color get primary => AppColors.primary;
  static Color get background => AppColors.background;
  static Color get accent => AppColors.accent;
  static Color get textPrimary => AppColors.textPrimary;
  static Color get textSecondary => AppColors.textSecondary;
}
