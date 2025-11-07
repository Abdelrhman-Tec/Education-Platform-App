import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          // Title Header
          HeaderPage(
            titleHeader: S.of(context).signIn,
            subTitleHeader: S.of(context).welcomeBack,
          ),
          // Email and Password Form
          EmailAndPassword(),
          verticalSpace(30),
          // Login Button
          _buildLoginButton(context: context),
          verticalSpace(10),
          // Forgot Password
          _buildForgotPasswordButton(context: context),
          verticalSpace(30),
          // Don't have an account
          AuthRedirectText(
            questionText: S.of(context).dontHaveAccount,
            actionText: S.of(context).signUp,
            onTap: () {
              context.pushNamed(Routes.register);
            },
          ),
          // Login Bloc Listener to handle login state
          LoginBlocListener(),
        ],
      ).paddingSymmetric(h: 20.w, v: 60.h),
    ),
  );
}

Widget _buildLoginButton({required BuildContext context}) {
  return CustomButton(
    text: S.of(context).login,
    backgroundColor: AppColors.mediumBlue,
    borderRadius: 5.r,
    height: 60.h,
    textColor: AppColors.white,
    onPressed: () => validateThenDoLogin(context),
  );
}

Widget _buildForgotPasswordButton({required BuildContext context}) {
  return TextButton(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.mediumBlue),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      textStyle: WidgetStateProperty.all(
        AppTextStyles.titleSmallSemiBold.copyWith(fontSize: 15.sp),
      ),
    ),
    onPressed: () {},
    child: Text(S.of(context).forgotPassword),
  );
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().login();
  }
}
