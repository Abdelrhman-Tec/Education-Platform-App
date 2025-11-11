import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/features/home/presentation/widgets/search_course_card.dart';
import 'package:education_platform_app/features/my_courses/presentation/my_courses_cubit/cubit/my_course_cubit.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  bool showSkeleton = true;

  @override
  void initState() {
    super.initState();
    context.read<MyCourseCubit>().getMyCourses();

    handleSkeletonLoading(this, (value) {
      setState(() {
        showSkeleton = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'كورساتي',
        showBack: false,
        backgroundColor: AppColors.mediumBlue,
        textColor: AppColors.white,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<MyCourseCubit, MyCourseState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mediumBlue),
          ),
          success: (mycourses) {
            if (mycourses.isEmpty) {
              return const Center(child: Text('لا توجد كورسات حتى الآن'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Skeletonizer(
                enabled: showSkeleton,
                child: Column(
                  children: List.generate(mycourses.length, (index) {
                    final course = mycourses[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child:
                          SearchCourseCard(
                                showDeleteIcon: true,
                                imageUrl: course.image ?? '',
                                title: course.title ?? '',
                                name: S.of(context).startCourse,
                                description: course.description ?? '',
                                onTap: () => context.pushNamed(
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
                              ),
                    );
                  }),
                ),
              ),
            );
          },
          failure: (message) => Center(child: Text(message)),
        );
      },
    );
  }

}
