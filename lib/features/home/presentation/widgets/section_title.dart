import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitle;
  const SectionTitle({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        sectionTitle,
        style: AppTextStyles.titleMediumBold.copyWith(
          fontSize: 21.sp,
          color: AppColors.mediumBlue,
        ),
      ),
    ).paddingSymmetric(h: 20);
  }
}