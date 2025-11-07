import 'dart:developer';

import 'package:education_platform_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:education_platform_app/features/auth/presentation/cubit/cubit_import.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginRepo loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  AuthCubit(this.loginRepo) : super(const AuthState.initial());

  Future<void> login() async {
    emit(const AuthState.loading());
    final response = await loginRepo.login(
      LoginRequestModel(email: email.text, password: password.text),
    );
    response.when(
      success: (loginResponse) {
        emit(AuthState.success(loginResponse));
      },
      failure: (error) {
        final message = error.apiErrorModel.message ?? '';
        log(message);
        emit(AuthState.failure(message: message.toString()));
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
