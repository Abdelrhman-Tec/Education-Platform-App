import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/features/categories/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/index.dart';
import 'package:education_platform_app/features/home/presentation/widgets/search_course_card.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool showSkeleton = true;

  @override
  void initState() {
    super.initState();
    handleSkeletonLoading(this, (value) {
      setState(() {
        showSkeleton = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).categories, showBack: false),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            HomeSearchBar(),
            buildCategoriesGrid(showSkeleton, context),
            verticalSpace(10),
            SectionTitle(sectionTitle: 'كورسات'),
            verticalSpace(10),
            buildCoursesListView(showSkeleton),
          ],
        ),
      ),
    );
  }

  Widget buildCategoriesGrid(bool showSkeleton, BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () =>
              const Center(child: CustomLoading(color: AppColors.mediumBlue)),
          success: (categories) => SizedBox(
            height: 280.h,
            child: Skeletonizer(
              enabled: showSkeleton,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 15.h,
                  childAspectRatio: 0.8,
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryItem(
                        title: category.name,
                        iconPath: category.image,
                        backgroundColorHex: category.backgroundColor,
                        iconColorHex: category.color,
                        width: 120,
                        height: 120,
                        ontap: () => context.pushNamed(
                          Routes.categoryScreen,
                          arguments: category,
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

  Widget buildCoursesListView(bool showSkeleton) {
    return BlocBuilder<CoursesCubit, CoursesState<List<CoursesResponseModel>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mediumBlue),
          ),
          success: (courses) => SizedBox(
            height: 360.h,
            child: Skeletonizer(
              enabled: showSkeleton,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: courses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return SearchCourseCard(
                        imageUrl: course.image ?? '',
                        title: course.title ?? '',
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
