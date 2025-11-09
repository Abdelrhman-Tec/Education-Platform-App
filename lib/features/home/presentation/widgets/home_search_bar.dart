import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/my_search_delegate.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  late final coursesCubit = context.read<CoursesCubit>();
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
    return Skeletonizer(
      enabled: _showSkeleton,

      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(
                  showSkeleton: _showSkeleton,
                  coursesCubit: coursesCubit,
                  onClose: () {
                    coursesCubit.getCourses();
                  },
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Text(
                    S.of(context).searchCourses,
                    style: AppTextStyles.titleSmallSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.greyBlue.withValues(alpha: 0.5),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.search,
                    color: AppColors.greyBlue.withValues(alpha: 0.8),
                  ),
                  horizontalSpace(10),
                ],
              ).paddingSymmetric(h: 20, v: 5),
            ).paddingSymmetric(h: 20),
          ),
        ],
      ),
    );
  }
}
