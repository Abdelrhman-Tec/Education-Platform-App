import 'package:education_platform_app/core/routing/index.dart';

class CoursesContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderRadius;

  const CoursesContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.borderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        border: Border.all(color: borderColor ?? Colors.grey.shade700),
      ),
      width: width ?? double.infinity,
      height: height ?? 400.h,
      child: child,
    );
  }
}
