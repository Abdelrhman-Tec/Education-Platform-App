import '../../../sign_in/presentation/widgets/auth_imports.dart';
import 'my_search_delegate.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
