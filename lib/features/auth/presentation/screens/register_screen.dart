import 'package:education_platform_app/features/auth/presentation/widgets/auth_imports.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context: context));
  }
}

Widget _buildBody({required BuildContext context}) {
  return SingleChildScrollView(
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderPage(
            titleHeader: S.of(context).signUp,
            subTitleHeader: S.of(context).signUpSubtitle,
            height: 160.h,
          ),
          verticalSpace(30),
          _buildRegisterForm(context: context),
          verticalSpace(30),
          _buildRegisterButton(context: context),
          verticalSpace(20),
          AuthRedirectText(
            questionText: S.of(context).alreadyHaveAccount,
            actionText: S.of(context).signIn,
            onTap: () => Navigator.pushNamed(context, Routes.login),
          ),
        ],
      ).paddingSymmetric(h: 20.w, v: 60.h),
    ),
  );
}

Widget _buildRegisterForm({required BuildContext context}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: S.of(context).firstName,
              borderColor: AppColors.mediumBlue,
            ),
          ),
          horizontalSpace(15),
          Expanded(
            child: CustomTextFormField(
              hintText: S.of(context).lastName,
              borderColor: AppColors.mediumBlue,
            ),
          ),
        ],
      ),
      verticalSpace(15),
      CustomTextFormField(
        hintText: S.of(context).email,
        borderColor: AppColors.mediumBlue,
      ),
      verticalSpace(15),
      CustomTextFormField(
        hintText: S.of(context).phoneNumber,
        borderColor: AppColors.mediumBlue,
      ),
      verticalSpace(15),
      CustomTextFormField(
        hintText: S.of(context).password,
        isPassword: true,
        borderColor: AppColors.mediumBlue,
      ),
    ],
  );
}

Widget _buildRegisterButton({required BuildContext context}) {
  return CustomButton(
    text: S.of(context).signUp,
    backgroundColor: AppColors.mediumBlue,
    borderRadius: 5.r,
    height: 60.h,
    textColor: AppColors.white,
    onPressed: () {},
  );
}
