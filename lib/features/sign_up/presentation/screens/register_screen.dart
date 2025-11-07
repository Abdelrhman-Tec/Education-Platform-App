import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:education_platform_app/features/sign_up/presentation/sign_up_cubit/cubit/register_cubit.dart';
import 'package:education_platform_app/features/sign_up/presentation/widgets/register_bloc_listener.dart';
import 'package:education_platform_app/features/sign_up/presentation/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderPage(
                height: 165.h,
                titleHeader: S.of(context).signUp,
                subTitleHeader: S.of(context).signUpSubtitle,
              ),
              verticalSpace(30),
              const RegisterForm(),
              verticalSpace(30),
              _buildRegisterButton(context),
              verticalSpace(20),
              AuthRedirectText(
                questionText: S.of(context).alreadyHaveAccount,
                actionText: S.of(context).signIn,
                onTap: () => Navigator.pushNamed(context, Routes.login),
              ),
              RegisterBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomButton(
      text: S.of(context).signUp,
      backgroundColor: AppColors.mediumBlue,
      borderRadius: 5.r,
      height: 60.h,
      textColor: AppColors.white,
      onPressed: () => _validateThenRegister(context),
    );
  }

  void _validateThenRegister(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.register();
    }
  }
}
