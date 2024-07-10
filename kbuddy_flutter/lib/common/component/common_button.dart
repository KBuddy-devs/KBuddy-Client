import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/component/text.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

class CommonButton extends StatefulWidget {
  final String name;
  final VoidCallback function;
  final bool isActivate;

  const CommonButton({
    required this.name,
    required this.function,
    required this.isActivate,
    super.key,
  });

  @override
  State<CommonButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<CommonButton> {
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
          color: widget.isActivate ? INDIGO_900 : LIGHTGRAY_300,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FlexText(
              content: widget.name,
              textStyle: btn100,
              fontColor: widget.isActivate ? WHITE : LIGHTGRAY_400,
            ),
          ),
        ),
      ),
    );
  }
}
