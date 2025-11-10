import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_info_row.dart';

class CourseDetailsInfo extends StatelessWidget {
  final String startDate;
  final String lectures;
  final String duration;

  const CourseDetailsInfo({
    super.key,
    required this.startDate,
    required this.lectures,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CourseInfoRow(
          icon: Icons.calendar_today_outlined,
          title: 'تاريخ البدء:',
          value: startDate,
          iconColor: Colors.grey.shade400,
          valueColor: Colors.grey.shade400,
        ),
        verticalSpace(12),
        CourseInfoRow(
          icon: Icons.video_library_outlined,
          title: 'المحاضرات:',
          value: lectures,
          iconColor: Colors.grey.shade400,
          valueColor: Colors.grey.shade400,
        ),
        verticalSpace(12),
        CourseInfoRow(
          icon: Icons.access_time_outlined,
          title: 'المدة:',
          value: duration,
          iconColor: Colors.grey.shade400,
          valueColor: Colors.grey.shade400,
        ),
      ],
    );
  }
}