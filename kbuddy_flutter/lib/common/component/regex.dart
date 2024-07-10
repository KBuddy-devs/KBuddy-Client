import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/password_validator.dart';

class PasswordValidationWidget extends ConsumerWidget {
  final String password;
  final String confirmPassword;
  final bool isConfirm;

  const PasswordValidationWidget({
    super.key,
    required this.password,
    required this.confirmPassword,
    this.isConfirm = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isConfirm != false) ...[
          _buildValidationRow(
            context,
            "At least 12 characters.",
            PasswordValidator.hasMinLength(password),
          ),
          _buildValidationRow(
            context,
            "Combination of letters and numbers.",
            PasswordValidator.hasUpperCase(password) ||
                PasswordValidator.hasLowerCase(password) &&
                    PasswordValidator.hasDigit(password),
          ),
          _buildValidationRow(
            context,
            "At least 1 uppercase letter.",
            PasswordValidator.hasUpperCase(password),
          ),
          _buildValidationRow(
            context,
            "At least 1 symbol.",
            PasswordValidator.hasSpecialChar(password),
          ),
          _buildValidationRow(
            context,
            "No more than 30 letters.",
            PasswordValidator.isMaxLength(password),
          ),
        ] else ...[
          _buildValidationRow(
            context,
            "Matching password.",
            PasswordValidator.passwordsMatch(password, confirmPassword),
          )
        ]
      ],
    );
  }

  Widget _buildValidationRow(BuildContext context, String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle_outlined : Icons.cancel_outlined,
          color: isValid ? Colors.green : Colors.red,
          size: 20,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.red,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
