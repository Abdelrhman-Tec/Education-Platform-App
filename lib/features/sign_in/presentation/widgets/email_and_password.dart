import 'package:education_platform_app/core/helpers/app_regex.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().password;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
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
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          verticalSpace(25),
          CustomTextFormField(
            prefixIcon: Icons.email,
            hintText: S.of(context).email,
            isPassword: false,
            // ignore: body_might_complete_normally_nullable
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return S.of(context).email; // "Please enter a valid email"
              }
            },
            controller: context.read<LoginCubit>().email,
          ),
          verticalSpace(17),
          CustomTextFormField(
            prefixIcon: Icons.lock,
            hintText: S.of(context).password,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).password; // "Please enter your password"
              }
              if (!AppRegex.hasLowerCase(value)) {
                return S
                    .of(context)
                    .passwordValidationLowercase; // "Password must have a lowercase letter"
              }
              if (!AppRegex.hasUpperCase(value)) {
                return S
                    .of(context)
                    .passwordValidationUppercase; // "Password must have an uppercase letter"
              }
              if (!AppRegex.hasNumber(value)) {
                return S
                    .of(context)
                    .phoneNumber; // "Password must have a number"
              }
              if (!AppRegex.hasSpecialCharacter(value)) {
                return S
                    .of(context)
                    .passwordValidationSpecialCharacter; // "Password must have a special character"
              }
              if (!AppRegex.hasMinLength(value)) {
                return S
                    .of(context)
                    .passwordValidationMinLength; // "Password must be at least 8 characters long"
              }
              return null;
            },
            controller: context.read<LoginCubit>().password,
          ),
          verticalSpace(15),
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

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
