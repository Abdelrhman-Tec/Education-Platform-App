import 'package:education_platform_app/features/categories/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/category_item.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final loading = state is Loading;
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () =>
              const Center(child: CustomLoading(color: AppColors.mediumBlue)),
          success: (categories) => SizedBox(
            height: 130.h,
            child: Skeletonizer(
              enabled: loading,
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
