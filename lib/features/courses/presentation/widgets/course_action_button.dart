import 'package:education_platform_app/core/routing/index.dart';

class CourseActionButton extends StatelessWidget {
  const CourseActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: S.of(context).addToCart,
      backgroundColor: AppColors.mediumBlue,
      borderRadius: 12.r,
      height: 56.h,
      textColor: AppColors.white,
      onPressed: () => _addToCart(context),
    );
  }

  void _addToCart(BuildContext context) {}
}
