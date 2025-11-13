import 'package:education_platform_app/core/helpers/spacing.dart';
import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:education_platform_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordValidation({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPasswordValidation(
          S.of(context).passwordValidationLowercase,
          hasLowercase,
        ),
        buildPasswordValidation(
          S.of(context).passwordValidationUppercase,
          hasUppercase,
        ),
        buildPasswordValidation(
          S.of(context).passwordValidationNumber,
          hasNumber,
        ),
        buildPasswordValidation(
          S.of(context).passwordValidationMinLength,
          hasMinLength,
        ),
        buildPasswordValidation(
          S.of(context).passwordValidationSpecialCharacter,
          hasSpecialCharacter,
        ),
      ],
    );
  }

  Widget buildPasswordValidation(String text, bool hasIsValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: !hasIsValidated
              ? AppColors.greyBlue
              : AppColors.mediumBlue,
        ),
        horizontalSpace(10),
        Text(
          text,
          style: TextStyle(
            color: AppColors.mediumBlue,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            decoration: hasIsValidated
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: AppColors.mediumBlue,
            decorationThickness: 2,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ],
    );
  }
}
