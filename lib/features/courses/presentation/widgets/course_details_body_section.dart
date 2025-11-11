import 'package:education_platform_app/core/helpers/spacing.dart';
import 'package:education_platform_app/export.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_action_button.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_description.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_details_info.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_header.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_video_player.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/instractor_info.dart';

class CourseDetailsBody extends StatelessWidget {
  final CoursesResponseModel course;

  const CourseDetailsBody({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseVideoPlayer(
            videoUrl: course.shortVideoUrl,
            thumbnailUrl: course.image,
          ),
          verticalSpace(16),
          CourseHeader(title: course.title ?? ''),
          verticalSpace(12),
          CourseDescription(description: course.description ?? ''),
          verticalSpace(24),
          InstructorInfo(instructorName: 'عبدالرحمن حسام حسن ندا'),
          verticalSpace(16),
          CourseDetailsInfo(
            startDate: '2025/10/5',
            lectures: '30 محاضرة',
            duration: '15 ساعة',
          ),
          verticalSpace(24),
          const CourseActionButton(),
        ],
      ),
    );
  }
}
