import 'package:education_platform_app/core/routing/index.dart';

class CourseInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? iconColor;
  final Color? titleColor;
  final Color? valueColor;
  final double iconSize;

  const CourseInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.iconColor,
    this.titleColor,
    this.valueColor,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: iconSize.w),
        horizontalSpace(8),
        Text(
          title,
          style: AppTextStyles.bodyMediumLight.copyWith(
            fontSize: 15.sp,
            color: titleColor,
          ),
        ),
        horizontalSpace(4.w),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMediumLight.copyWith(
              fontSize: 15.sp,
              color: valueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
