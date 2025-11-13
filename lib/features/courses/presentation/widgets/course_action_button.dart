import 'package:education_platform_app/core/function/snakbar.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';

class CourseActionButton extends StatelessWidget {
  final int courseId;
  const CourseActionButton({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: S.of(context).addToCart,
      backgroundColor: AppColors.mediumBlue,
      borderRadius: 12.r,
      height: 56.h,
      textColor: AppColors.white,
      onPressed: () => _addToCart(context, courseId),
    );
  }

  void _addToCart(BuildContext context, int courseId) async {
    final cartCubit = context.read<CartCubit>();

    // إظهار loading وهمي
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          Center(child: CircularProgressIndicator(color: AppColors.mediumBlue)),
    );

    await Future.delayed(const Duration(seconds: 3));

    await cartCubit.addToCart(courseId: courseId);

    Navigator.of(context).pop();

    final state = cartCubit.state;
    state.maybeWhen(
      success: (_) {
        showCustomSnackbar(
          context,
          message: 'تمت إضافة الكورس للكارت بنجاح',
          backgroundColor: AppColors.mediumBlue,
        );
      },
      failure: (error) {
        showCustomSnackbar(
          context,
          message: error,
          backgroundColor: Colors.redAccent,
        );
      },
      orElse: () {},
    );
  }
}
