import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/course_card.dart';

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
    handleSkeletonLoading(this, (value) {
      setState(() {
        _showSkeleton = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState<List<CoursesResponseModel>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mediumBlue),
          ),
          success: (courses) => SizedBox(
            height: 360,
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
                        students: course.students ?? 0,
                        lectures: 33,
                        likes: course.likes ?? 0,
                        ontap: () => context.pushNamed(
                          Routes.courseDetailsScreen,
                          arguments: course,
                        ),
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
