import 'package:education_platform_app/core/constants/app_text_style.dart';
import 'package:education_platform_app/core/helpers/spacing.dart';
import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderPage extends StatelessWidget {
  final String titleHeader;
  final String subTitleHeader;
  final double height;
  const HeaderPage({
    this.height = 120,
    super.key,
    required this.titleHeader,
    required this.subTitleHeader,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleHeader,
            style: AppTextStyles.titleLargeBold.copyWith(fontSize: 40.sp),
          ),
          verticalSpace(10),
          Text(
            subTitleHeader,
            style: AppTextStyles.titleSmallBold.copyWith(
              color: AppColors.mediumBlue.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
