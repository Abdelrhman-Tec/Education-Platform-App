import 'package:flutter_animate/flutter_animate.dart';
import 'package:education_platform_app/core/routing/index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "${S.of(context).edit} ${S.of(context).profile}",
        backgroundColor: AppColors.mediumBlue,
        textColor: AppColors.white,
      ),
      body: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  Widget _sectionTitle(BuildContext context, String text) {
    return Align(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            style: AppTextStyles.titleMediumSemiBold.copyWith(fontSize: 16.sp),
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms)
        .slideX(begin: 0.2, curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.mediumBlue,
              radius: 50.r,
              child: Text(
                'ع',
                style: AppTextStyles.titleSmallBold.copyWith(
                  fontSize: 40.sp,
                  color: AppColors.white,
                ),
              ),
            ).animate().scale(duration: 500.ms, curve: Curves.easeOut),
            verticalSpace(40),
            _sectionTitle(context, S.of(context).personalInfo),
            verticalSpace(15),
            Text(
              'يجب ان تكون معلومات الحساب صحيحة حتى تتمكن من استلام الشهادات الخاصة بك',
              style: AppTextStyles.titleMediumSemiBold.copyWith(
                fontSize: 16.sp,
                color: Colors.grey.shade300,
              ),
            ).animate().fadeIn(duration: 500.ms, delay: 200.ms),
            verticalSpace(30),
            _sectionTitle(context, S.of(context).fullName),
            verticalSpace(15),
            CustomTextFormField(
              hintText: S.of(context).fullName,
            ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
            verticalSpace(30),
            _sectionTitle(context, S.of(context).email),
            verticalSpace(15),
            CustomTextFormField(
              hintText: S.of(context).email,
            ).animate().fadeIn(duration: 500.ms, delay: 400.ms),
            verticalSpace(40),
            CustomButton(
              text: S.of(context).save,
              onPressed: () {},
              backgroundColor: AppColors.yellow,
            ).animate().fadeIn(duration: 500.ms, delay: 500.ms),
            verticalSpace(30),
            _sectionTitle(context, S.of(context).password),
            verticalSpace(15),
            CustomTextFormField(
              hintText: S.of(context).passwordConfirmation,
            ).animate().fadeIn(duration: 500.ms, delay: 600.ms),
            verticalSpace(30),
            _sectionTitle(context, S.of(context).newPassword),
            verticalSpace(15),
            CustomTextFormField(
              hintText: S.of(context).newPassword,
            ).animate().fadeIn(duration: 500.ms, delay: 700.ms),
          ],
        ).paddingSymmetric(h: 20, v: 30),
      ),
    );
  }
}
