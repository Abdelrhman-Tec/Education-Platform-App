import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/home/presentation/widgets/search_course_card.dart';
import 'package:education_platform_app/features/lessons/presentation/lessons_cubit/cubit/lessons_cubit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LessonsScreen extends StatefulWidget {
  final int courseId;
  final String imageUrl;
  const LessonsScreen({
    super.key,
    required this.courseId,
    required this.imageUrl,
  });

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LessonsCubit>().getCourseLessons(courseId: widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'المحاضرات',
        showBack: true,
        backgroundColor: AppColors.mediumBlue,
        textColor: AppColors.white,
      ),
      body: _buildBody(imageUrl: widget.imageUrl),
    );
  }
}

Widget _buildBody({required String imageUrl}) {
  return BlocBuilder<LessonsCubit, LessonsState>(
    builder: (context, state) {
      return state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.mediumBlue),
        ),
        success: (lessons) {
          if (lessons.isEmpty) {
            return const Center(child: Text('لا توجد محاضرات حتى الآن'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              final courseId =
                  ModalRoute.of(context)?.settings.arguments as int?;
              if (courseId != null) {
                await context.read<LessonsCubit>().getCourseLessons(
                  courseId: courseId,
                );
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: List.generate(lessons.length, (index) {
                  final lesson = lessons[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child:
                        SearchCourseCard(
                              showDeleteIcon: false, // هنا مش هنعمل delete
                              showDeleteBtn: false,
                              imageUrl:
                                  imageUrl, // ممكن تحط صورة افتراضية أو lesson.imageUrl لو موجود
                              title: lesson.title,
                              name: 'تشغيل الدرس', // بدل startCourse
                              description: 'المدة: ${lesson.duration} ثانية',
                              onTap: () {
                                context.pushNamed(
                                  Routes.lessonPlayer,
                                  arguments: lesson,
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
                  );
                }),
              ),
            ),
          );
        },
        error: (message) => Center(child: Text(message)),
      );
    },
  );
}
