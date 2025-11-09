import 'package:skeletonizer/skeletonizer.dart';

import '../../../sign_in/presentation/widgets/auth_imports.dart';
import 'my_search_delegate.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
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
    return Skeletonizer(
      enabled: _showSkeleton,

      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: MySearchDelegate());
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
