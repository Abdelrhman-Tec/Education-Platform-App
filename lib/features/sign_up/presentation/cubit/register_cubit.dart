import 'package:education_platform_app/core/networking/api_result.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_request_model.dart';
import 'package:education_platform_app/features/sign_up/data/repo/register_repo.dart';
import 'package:education_platform_app/features/sign_up/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  RegisterCubit(this.registerRepo) : super(const RegisterState.initial());

  Future<void> register() async {
    emit(const RegisterState.loading());
    final response = await registerRepo.register(
      RegisterRequestModel(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        password: password.text,
        passwordConfirmation: confirmPassword.text,
      ),
    );

    response.when(
      success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
      },
      failure: (error) {
        final message = error.apiErrorModel.message ?? 'Registration failed';
        emit(RegisterState.failure(message: message.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    return super.close();
  }
}
