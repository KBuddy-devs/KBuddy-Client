import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/validator.dart';

enum ValidationType { pwd, pwdMatch, fName, lName, email, id }

class ValidationWidget extends ConsumerWidget {
  final String text;
  final String confirmPassword;
  final ValidationType validationType;

  const ValidationWidget({
    super.key,
    required this.text,
    this.confirmPassword = '',
    required this.validationType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (validationType == ValidationType.pwd) ...[
          _buildValidationRow(
            context,
            "At least 8 characters.",
            Validator.hasMinLength(text),
          ),
          _buildValidationRow(
            context,
            "Combination of letters and numbers.",
            Validator.hasUpperCase(text) ||
                Validator.hasLowerCase(text) && Validator.hasDigit(text),
          ),
          _buildValidationRow(
            context,
            "At least 1 symbol.",
            Validator.hasSpecialChar(text),
          ),
          _buildValidationRow(
            context,
            "No more than 30 letters.",
            Validator.isMaxLength(text),
          ),
        ] else if (validationType == ValidationType.pwdMatch) ...[
          _buildValidationRow(
            context,
            "Matching password.",
            Validator.passwordsMatch(text, confirmPassword),
          )
        ] else if (validationType == ValidationType.email) ...[
          _buildValidationRow(
              context, "Invalid Email Format", Validator.isValidEmail(text))
        ] else if (validationType == ValidationType.id) ...[
          _buildValidationRow(
            context,
            "At least 3 letters",
            Validator.isMinLengthId(text),
          ),
          _buildValidationRow(
            context,
            "No more than 20 letters",
            Validator.isMaxLengthId(text),
          )
        ] else if (validationType == ValidationType.fName) ...[
          _buildValidationRow(
            context,
            "No more than 30 letters",
            Validator.isMaxLengthId(text),
          )
        ] else if (validationType == ValidationType.lName) ...[
          _buildValidationRow(
            context,
            "No more than 30 letters",
            Validator.isMaxLengthId(text),
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
