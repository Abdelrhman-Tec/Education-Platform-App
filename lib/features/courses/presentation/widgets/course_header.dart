import 'package:education_platform_app/core/routing/index.dart';

class CourseHeader extends StatelessWidget {
  final String title;

  const CourseHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.titleLargeBold.copyWith(
        fontSize: 26.sp,
        height: 1.3,
      ),
    );
  }
}

