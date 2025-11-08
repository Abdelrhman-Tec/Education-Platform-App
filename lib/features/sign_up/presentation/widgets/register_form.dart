import 'package:education_platform_app/core/helpers/app_regex.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/password_validation.dart';
import 'package:education_platform_app/features/sign_up/presentation/sign_up_cubit/cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<RegisterCubit>();
    passwordController = cubit.password;
    _setupPasswordListener();
  }

  void _setupPasswordListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: cubit.firstName,
                  hintText: S.of(context).firstName,
                  borderColor: AppColors.mediumBlue,
                  validator: (value) => _validateRequired(context, value),
                ),
              ),
              horizontalSpace(15),
              Expanded(
                child: CustomTextFormField(
                  controller: cubit.lastName,
                  hintText: S.of(context).lastName,
                  borderColor: AppColors.mediumBlue,
                  validator: (value) => _validateRequired(context, value),
                ),
              ),
            ],
          ),
          verticalSpace(15),
          CustomTextFormField(
            controller: cubit.email,
            hintText: S.of(context).email,
            borderColor: AppColors.mediumBlue,
            validator: (value) => _validateEmail(context, value),
          ),
          verticalSpace(15),
          CustomTextFormField(
            controller: cubit.password,
            hintText: S.of(context).password,
            borderColor: AppColors.mediumBlue,
            isPassword: true,
            validator: (value) => _validatePassword(context, value),
          ),
          verticalSpace(15),
          CustomTextFormField(
            controller: cubit.confirmPassword,
            hintText: S.of(context).passwordConfirmation,
            borderColor: AppColors.mediumBlue,
            isPassword: true,
            validator: (value) =>
                _validateConfirmPassword(context, value, cubit),
          ),
          verticalSpace(15),
          if (passwordController.text.isNotEmpty)
            PasswordValidation(
              hasLowercase: hasLowercase,
              hasUppercase: hasUppercase,
              hasNumber: hasNumber,
              hasSpecialCharacter: hasSpecialCharacter,
              hasMinLength: hasMinLength,
            ),
        ],
      ),
    );
  }

  String? _validateRequired(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).requiredField;
    }
    return null;
  }

  String? _validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
      return S.of(context).email;
    }
    return null;
  }

  String? _validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return S.of(context).password;
    if (!AppRegex.hasLowerCase(value)) {
      return S.of(context).passwordValidationLowercase;
    }
    if (!AppRegex.hasUpperCase(value)) {
      return S.of(context).passwordValidationUppercase;
    }
    if (!AppRegex.hasNumber(value)) {
      return S.of(context).passwordValidationNumber;
    }
    if (!AppRegex.hasSpecialCharacter(value)) {
      return S.of(context).passwordValidationSpecialCharacter;
    }
    if (!AppRegex.hasMinLength(value)) {
      return S.of(context).passwordValidationMinLength;
    }
    return null;
  }

  String? _validateConfirmPassword(
    BuildContext context,
    String? value,
    RegisterCubit cubit,
  ) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordConfirmation;
    }
    if (value != cubit.password.text) {
      return S.of(context).passwordMismatch;
    }
    return null;
  }
}
