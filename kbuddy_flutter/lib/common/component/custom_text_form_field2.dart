import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

class CustomTextFormField2 extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final bool isNumericOnly;
  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField2({
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.isNumericOnly = false,
    super.key,
  });

  @override
  State<CustomTextFormField2> createState() => _CustomTextFormField2State();
}

class _CustomTextFormField2State extends State<CustomTextFormField2> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      autofocus: true,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: title300Medium,
        border: const OutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {},
              )
            : null,
        hintText: widget.hintText,
        hintStyle: body100Light,
      ),
      obscureText: widget.isPassword,
      keyboardType: widget.isNumericOnly ? TextInputType.number : null,
      inputFormatters: widget.isNumericOnly
          ? [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ]
          : null,
    );
  }
}
