import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/component/text.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

class LoginButton extends StatefulWidget {
  final String name;
  final VoidCallback function;
  final Color? color;
  final Image? image;
  final bool isImage;

  const LoginButton({
    required this.name,
    required this.function,
    this.color,
    this.image,
    this.isImage = false,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.image ?? const SizedBox(),
            widget.isImage
                ? const SizedBox(
                    width: 20,
                  )
                : const SizedBox(),
            FlexText(
              content: widget.name,
              textStyle: btn100,
            ),
          ],
        ),
      ),
    );
  }
}
