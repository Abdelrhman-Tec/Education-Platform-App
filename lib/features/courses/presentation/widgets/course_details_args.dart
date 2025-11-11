import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';

class CourseDetailsArgs {
  final CoursesResponseModel course;
  final int userId;

  CourseDetailsArgs({required this.course, required this.userId});
}
