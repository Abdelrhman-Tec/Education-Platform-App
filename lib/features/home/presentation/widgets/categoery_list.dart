import 'package:education_platform_app/features/categories/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/category_item.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () =>
              const Center(child: CustomLoading(color: AppColors.mediumBlue)),
          success: (categories) => SizedBox(
            height: 130.h,
            child: Skeletonizer(
              enabled: _showSkeleton,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => horizontalSpace(15),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryItem(
                        title: category.name ?? '',
                        iconPath: category.image ?? '',
                        backgroundColorHex: category.backgroundColor ?? '',
                        iconColorHex: category.color ?? '',
                        width: 120,
                        height: 120,
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
