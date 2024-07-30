import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final bool? readonly;

  const CustomTextFormField({
    required this.label,
    required this.controller,
    this.readonly,
    this.isPassword = false,
    this.focusNode,
    this.onChanged,
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
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      readOnly: widget.readonly ?? false,
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
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
