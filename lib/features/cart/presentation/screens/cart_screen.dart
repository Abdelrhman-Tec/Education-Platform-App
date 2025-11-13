import 'dart:developer';

import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/core/function/snakbar.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/cart/data/model/cart_response_model.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_container.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_list_view.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_summary_card.dart';
import 'package:education_platform_app/features/enrollments/enrollments_cubit/cubit/enrollments_cubit.dart';
import 'package:education_platform_app/features/my_courses/presentation/my_courses_cubit/cubit/my_course_cubit.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_response_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showSkeleton = false;

  @override
  void initState() {
    super.initState();

    final userJson = SharedPrefsService.getString('user');
    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson)['user']);
      if (user.id != null) {
        context.read<CartCubit>().getAllItemCart(user.id!);
      }
    }
    handleSkeletonLoading(this, (value) {
      setState(() {
        showSkeleton = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).cart,
        showBack: false,
        backgroundColor: AppColors.mediumBlue,
        textColor: AppColors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (cartItems) {
            final items = cartItems as List<Cart>;
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    CoursesContainer(cartItems: items, child: CourseListView()),
                    verticalSpace(20),
                    CoursesContainer(
                      height: 250.h,
                      child: CheckoutSummaryCard(
                        hintText: S.of(context).enterCoupon,
                        applyText: S.of(context).apply,
                        subtotal: 0,
                        discount: 0,
                        total: 0,
                        onApply: () {},
                      ),
                    ),
                    verticalSpace(20),
                    CustomButton(
                      backgroundColor: AppColors.yellow,
                      text: S.of(context).checkout,
                      onPressed: () => handleCheckout(context),
                    ),
                  ],
                ).paddingSymmetric(h: 20, v: 30),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Future<void> handleCheckout(BuildContext context) async {
    final cartCubit = context.read<CartCubit>();
    final enrollmentsCubit = context.read<EnrollmentsCubit>();
    final myCoursesCubit = context.read<MyCourseCubit>();

    final cartState = cartCubit.state;

    cartState.maybeWhen(
      success: (cartItems) async {
        final cartList = cartItems as List<Cart>;

        if (cartList.isEmpty) {
          showCustomSnackbar(context, message: 'السلة فارغة');
          return;
        }

        final courseIds = cartList
            .map<int>((item) => item.course!.id!)
            .toList();

        List<int> existingCourseIds = [];
        myCoursesCubit.state.maybeWhen(
          success: (myCourses) {
            existingCourseIds = myCourses.map((c) => c.id!).toList();
          },
          orElse: () {},
        );

        final duplicateCourses = courseIds
            .where((id) => existingCourseIds.contains(id))
            .toList();

        if (duplicateCourses.isNotEmpty) {
          showCustomMessageDialog(context, 'أنت مسجل بالفعل في هذه الكورسات');
          return;
        }

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => Center(
            child: CircularProgressIndicator(color: AppColors.mediumBlue),
          ),
        );

        await Future.delayed(const Duration(seconds: 3));

        await enrollmentsCubit.enrollCart(courseIds);

        Navigator.of(context).pop();

        final userJson = SharedPrefsService.getString('user');
        if (userJson != null) {
          final user = User.fromJson(jsonDecode(userJson)['user']);
          if (user.id != null) {
            cartCubit.getAllItemCart(user.id!);
          }
        }

        showCustomSnackbar(context, message: 'تم تسجيل جميع الكورسات بنجاح');
      },
      orElse: () {
        log('Cart state is not success');
      },
    );
  }

  void showCustomMessageDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mediumBlue.withValues(alpha: 0.1),
                ),
                padding: EdgeInsets.all(12.w),
                child: Icon(
                  Icons.error_outline,
                  color: AppColors.mediumBlue,
                  size: 40.sp,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'تنبيه',
                style: AppTextStyles.titleMediumSemiBold.copyWith(
                  color: AppColors.mediumBlue,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMediumNormal,
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mediumBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  onPressed: () => context.pop(),
                  child: Text(
                    'حسنا',
                    style: AppTextStyles.bodyMediumNormal.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
