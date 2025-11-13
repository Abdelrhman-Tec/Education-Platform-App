import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class AuthRedirectText extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onTap;

  /// This file defines a custom widget used in authentication screens
  /// (such as Login or Sign Up) to display a question followed by an
  /// actionable text that triggers navigation when tapped.
  ///
  /// Example:
  /// AuthRedirectText(
  ///   questionText: "Don’t have an account?",
  ///   actionText: "Sign up",
  ///   onTap: () => Navigator.pushNamed(context, Routes.register),
  /// )
  ///
  /// The widget uses:
  /// - AppTextStyles for consistent text styling.
  /// - AppColors for color management.
  /// - horizontalSpace to add spacing between the texts.
  const AuthRedirectText({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: AppTextStyles.titleSmallSemiBold.copyWith(
            color: AppColors.mediumBlue.withValues(alpha: .4),
            fontSize: 15.sp,
          ),
        ),
        horizontalSpace(6),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: AppTextStyles.titleSmallSemiBold.copyWith(
              color: AppColors.mediumBlue,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
