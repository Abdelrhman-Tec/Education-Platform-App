import 'package:flutter/material.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_details_app_bar.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/course_details_body_section.dart';

class CourseDetailsScreen extends StatelessWidget {
  final CoursesResponseModel course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CourseDetailsAppBar(course: course),
      body: CourseDetailsBody(course: course),
    );
  }
}
