import 'dart:ui';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String name;
  final VoidCallback onCartTap;
  const HomeAppBar({super.key, required this.name, required this.onCartTap});

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
    handleSkeletonLoading(this, (value) {
      setState(() {
        _showSkeleton = value;
      });
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
            // Cart Icon with dynamic badge
            BlocBuilder<CartCubit, CartState<dynamic>>(
              builder: (context, state) {
                int cartCount = 0;
                state.maybeWhen(
                  success: (cartItems) {
                    cartCount = (cartItems as List).length;
                  },
                  orElse: () {},
                );

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: widget.onCartTap,
                      child: Icon(
                        Icons.shopping_cart,
                        color: AppColors.mediumBlue,
                        size: 28.sp,
                      ),
                    ),
                    if (cartCount > 0)
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
                              "$cartCount",
                              style: AppTextStyles.titleSmallSemiBold.copyWith(
                                color: AppColors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
