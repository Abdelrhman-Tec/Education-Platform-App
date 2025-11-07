import 'package:education_platform_app/features/sign_up/presentation/cubit/register_state.dart';
import 'package:education_platform_app/features/sign_up/presentation/cubit/register_cubit.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            showDialog(
              context: context,
              builder: (context) =>
                  const CustomLoading(color: AppColors.mediumBlue),
            );
          },
          success: (registerResponse) {
            context.pop();
            context.pushReplacementNamed(
              Routes.login,
            );
          },
          failure: (message) => setupErrorState(context, message),
          orElse: () {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
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
                'Error',
                style: AppTextStyles.titleMediumSemiBold.copyWith(
                  color: AppColors.mediumBlue,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                error,
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
                    'Got it',
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
