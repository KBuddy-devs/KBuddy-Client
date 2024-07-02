import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

class LoginButton extends StatefulWidget {
  final String name;
  final VoidCallback function;
  final Color? color;
  final Image? image;

  const LoginButton({
    required this.name,
    required this.function,
    this.color,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: LIGHTGRAY_300),
          color: widget.color ?? LIGHTGRAY_300,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.image ?? SizedBox(),
              SizedBox(
                width: 20,
              ),
              Text(widget.name),
            ],
          ),
        ),
      ),
    );
  }
}
