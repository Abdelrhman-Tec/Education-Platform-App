import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/home/presentation/widgets/course_card.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({super.key});

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  bool _showSkeleton = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _showSkeleton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState<List<Course>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mediumBlue),
          ),
          success: (courses) => SizedBox(
            height: 360.h,
            child: Skeletonizer(
              enabled: _showSkeleton,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: courses.length,
                separatorBuilder: (_, __) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseCard(
                        imageUrl: course.image ?? '',
                        title: course.title ?? '',
                        price: course.price ?? '',
                        students: 33,
                        lectures: 33,
                        likes: 100,
                      )
                      .animate(delay: (index * 100).ms)
                      .fadeIn(duration: 700.ms)
                      .slideY(
                        begin: 0.2,
                        duration: 400.ms,
                        curve: Curves.easeOut,
                      );
                },
              ),
            ),
          ),
          failure: (message) => Center(child: Text(message)),
        );
      },
    );
  }
}
