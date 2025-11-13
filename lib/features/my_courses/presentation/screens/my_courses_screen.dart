import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/features/enrollments/enrollments_cubit/cubit/enrollments_cubit.dart';
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
  Set<int> isDeleting = {};

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  void _loadCourses() {
    context.read<MyCourseCubit>().getMyCourses();

    // التحكم في skeleton loading
    handleSkeletonLoading(this, (value) {
      if (mounted) {
        setState(() {
          showSkeleton = value;
        });
      }
    });
  }

  Future<void> _deleteCourse(int courseId) async {
    setState(() => isDeleting.add(courseId));

    try {
      await context.read<EnrollmentsCubit>().unenroll(courseId);
      await context
          .read<MyCourseCubit>()
          .getMyCourses(); // إعادة تحميل الكورسات
    } catch (_) {
      // يمكن إضافة رسالة خطأ هنا إذا أردت
    } finally {
      if (mounted) setState(() => isDeleting.remove(courseId));
    }
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
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

            return RefreshIndicator(
              onRefresh: () async => _loadCourses(),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Skeletonizer(
                  enabled: showSkeleton,
                  child: Column(
                    children: List.generate(mycourses.length, (index) {
                      final course = mycourses[index];
                      final deleting = isDeleting.contains(course.id);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Stack(
                          children: [
                            SearchCourseCard(
                                  showDeleteIcon: !deleting,
                                  imageUrl: course.image ?? '',
                                  title: course.title ?? '',
                                  name: S.of(context).startCourse,
                                  description: course.description ?? '',
                                  onTap: () => context.pushNamed(
                                    Routes.courseDetailsScreen,
                                    arguments: course,
                                  ),
                                  ontapDelete: deleting
                                      ? null
                                      : () => _deleteCourse(course.id!),
                                  goLessonsScreen: () {
                                    context.pushNamed(
                                      Routes.lessonsScreen,
                                      arguments: {
                                        'id': course.id,
                                        'image': course.image,
                                      },
                                    );
                                  },
                                )
                                .animate(delay: (index * 100).ms)
                                .fadeIn(duration: 700.ms)
                                .slideY(
                                  begin: 0.2,
                                  duration: 400.ms,
                                  curve: Curves.easeOut,
                                ),

                            if (deleting)
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.mediumBlue,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
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
