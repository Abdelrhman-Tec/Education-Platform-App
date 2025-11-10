import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_info_row.dart';

class InstructorInfo extends StatelessWidget {
  final String instructorName;

  const InstructorInfo({super.key, required this.instructorName});

  @override
  Widget build(BuildContext context) {
    return CourseInfoRow(
      icon: Icons.person_outline,
      title: 'المدرب:',
      value: instructorName,
      iconColor: Colors.grey.shade400,
      titleColor: Colors.grey.shade400,
      valueColor: Colors.grey.shade400,
    );
  }
}