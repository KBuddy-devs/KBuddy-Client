import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

class CustomTextFormField2 extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final String? hintText;

  const CustomTextFormField2({
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.hintText,
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
    );
  }
}
