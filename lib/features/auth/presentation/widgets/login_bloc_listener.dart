import 'package:education_platform_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:education_platform_app/features/auth/presentation/widgets/auth_imports.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.mediumBlue),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.home);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    if (Navigator.canPop(context)) {
      context.pop();
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () {
              if (Navigator.canPop(context)) context.pop();
            },
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
