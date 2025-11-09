import 'dart:ui';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

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
      if (mounted) {
        setState(() {
          _showSkeleton = false;
        });
      }
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
            SizedBox(
              width: 200.w,
              height: 60.h,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/profile.jpg"),
                        ),
                        shape: BoxShape.circle,
                        color: AppColors.lightGreyBlue,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    "Abdelrhman Nada",
                    style: AppTextStyles.titleSmallSemiBold,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AppColors.mediumBlue,
                  size: 26,
                ),
                Positioned(
                  top: 1,
                  right: 12.w,
                  child: Container(
                    width: 14.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "0",
                          style: AppTextStyles.titleSmallSemiBold.copyWith(
                            color: AppColors.white,
                            fontSize: 9.sp,
                          ),
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

  Size get preferredSize => Size.fromHeight(80.h);
}
