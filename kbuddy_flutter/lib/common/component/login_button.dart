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
  final TextEditingController? controller;

  const LoginButton({
    required this.name,
    required this.function,
    this.color,
    this.image,
    this.isImage = false,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onControllerChanged); // 리스너 추가
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged); // 리스너 제거
    super.dispose();
  }

  void _onControllerChanged() {
    setState(() {}); // 상태 업데이트
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive =
        widget.controller != null && widget.controller!.text.isNotEmpty;
    return GestureDetector(
      onTap: _isLoading ? null : _handleTap,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: LIGHTGRAY_300),
          color: isActive ? PRIMARY_COLOR : widget.color ?? LIGHTGRAY_300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isActive ? Colors.white : PRIMARY_COLOR),
                ),
              )
            else ...[
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
          ],
        ),
      ),
    );
  }

  Future<void> _handleTap() async {
    setState(() {
      _isLoading = true;
    });
    try {
      widget.function();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
