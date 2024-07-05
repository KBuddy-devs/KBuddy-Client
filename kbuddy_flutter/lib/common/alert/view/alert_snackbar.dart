import 'package:flutter/material.dart';

import '../../const/colors.dart';

enum AlertSnackbarEnum { success, error, info }

class AlertSnackbar extends StatelessWidget {
  final String message;
  final AlertSnackbarEnum status;
  final VoidCallback onClose;
  const AlertSnackbar({
    super.key,
    required this.message,
    required this.status,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: status == AlertSnackbarEnum.success
            ? GREEN_100
            : (status == AlertSnackbarEnum.error ? RED_100 : INDIGO_100),
        border: Border.all(
            color: status == AlertSnackbarEnum.success
                ? GREEN_900
                : (status == AlertSnackbarEnum.error ? RED_900 : INDIGO_900)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Image.asset(
              'asset/images/alert_${status.toString().split('.').last}.png',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: BLACK,
              ),
            ),
          ),
          // 팝업이 떠있을 때 close 버튼 누를 시 팝업 끄기
          GestureDetector(
            onTap: onClose,
            child: SizedBox(
              width: 24,
              child: Image.asset(
                'asset/images/close_circle_white_24px.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
