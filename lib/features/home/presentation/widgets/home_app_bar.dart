import 'dart:ui';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String name;

  const HomeAppBar({super.key, required this.name});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _showSkeleton = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) setState(() => _showSkeleton = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: AppColors.white.withValues(alpha: 0.2)),
        ),
      ),
      title: Skeletonizer(
        enabled: _showSkeleton,
        child: Row(
          children: [
            // Circle + Name
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.lightGreyBlue.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26.r,
                    backgroundColor: AppColors.lightGreyBlue,
                    child: Text(
                      widget.name[0].toUpperCase(),
                      style: AppTextStyles.titleSmallSemiBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(widget.name, style: AppTextStyles.titleSmallSemiBold),
                ],
              ),
            ),
            const Spacer(),
            // Cart Icon with badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AppColors.mediumBlue,
                  size: 28.sp,
                ),
                Positioned(
                  right: -6.w,
                  top: -4.h,
                  child: Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.w,
                      minHeight: 16.h,
                    ),
                    child: Center(
                      child: Text(
                        "0",
                        style: AppTextStyles.titleSmallSemiBold.copyWith(
                          color: AppColors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
