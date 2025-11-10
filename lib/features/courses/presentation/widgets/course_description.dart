import 'package:education_platform_app/core/routing/index.dart';

class CourseDescription extends StatelessWidget {
  final String description;

  const CourseDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.bodyMediumLight.copyWith(
        fontSize: 16.sp,
        color: Colors.grey.shade400,
        height: 1.5,
      ),
      textAlign: TextAlign.start,
    );
  }
}