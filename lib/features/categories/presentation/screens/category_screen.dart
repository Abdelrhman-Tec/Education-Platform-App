import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/course_card.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  final int coursesId;
  const CategoryScreen({
    super.key,
    required this.title,
    required this.coursesId,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    context.read<CoursesCubit>().getCoursesById(widget.coursesId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mediumBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.white,
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                widget.title,
                style: AppTextStyles.titleSmallBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return BlocBuilder<CoursesCubit, CoursesState<List<Course>>>(
    builder: (context, state) {
      return state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.mediumBlue),
        ),
        success: (courses) {
          if (courses.isEmpty) {
            return const Center(child: Text('لا توجد كورسات في هذا الصنف'));
          }

          return GridView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1 / 1,
            ),
            itemCount: courses.length,
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
                  .slideY(begin: 0.2, duration: 400.ms, curve: Curves.easeOut);
            },
          );
        },
        failure: (message) => Center(child: Text(message)),
      );
    },
  );
}
