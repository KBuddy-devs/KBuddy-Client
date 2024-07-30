import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final int? length;

  const CustomTextFormField({
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.length = null,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: widget.length,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {},
              )
            : null,
      ),
      obscureText: widget.isPassword,
    );
  }
}
