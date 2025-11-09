import 'dart:convert';

import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:education_platform_app/features/sign_in/presentation/sign_in_cubit/cubit/login_state.dart';
import 'package:education_platform_app/features/sign_in/presentation/sign_in_cubit/cubit/cubit_import.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  Future<void> login() async {
    emit(const LoginState.loading());

    final response = await loginRepo.login(
      LoginRequestModel(email: email.text, password: password.text),
    );

    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
        SharedPrefsService.saveString('token', loginResponse.token);
        SharedPrefsService.saveString(
          'user',
          jsonEncode(loginResponse.toJson()),
        );
      },
      failure: (error) {
        final message = error.apiErrorModel.message ?? '';
        emit(LoginState.failure(message: message.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
