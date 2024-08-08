import 'package:flutter/material.dart';

import '../view/alert_snackbar.dart';

enum AlertSnackbarPositionEnum { top, bottom }

///
/// 사용 가능한 범위 : context를 가져올 수 있는 곳.
/// ex) view, build widget 등에서 사용 가능
///
/// 사용 예시 : 다음과 같음.
///
///
///
/// AlertSnackbarProvider.showAlertSnackbar
/// (
/// context: context,
/// message: 'sample text',
/// status: AlertSnackbarEnum.success,
/// position: AlertSnackbarPositionEnum.top,
/// duration: 5,
/// );
///
class AlertSnackbarProvider {
  static void showAlertSnackbar({
    required BuildContext context,
    required String message,
    required AlertSnackbarEnum status,
    required AlertSnackbarPositionEnum position,
    int duration = 3,
  }) {
    OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: position == AlertSnackbarPositionEnum.top ? 40 : null,
        bottom: position == AlertSnackbarPositionEnum.bottom ? 20 : null,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: AlertSnackbar(
              message: message,
              status: status,
              onClose: () {
                overlayEntry.remove();
              }),
        ),
      ),
    );

    overlayState.insert(overlayEntry);

    // 일정 시간 후에 자동으로 사라지도록 설정
    Future.delayed(Duration(seconds: duration), () {
      overlayEntry.remove();
    });
  }

  // static void showAlertSnackbar({
  //   required BuildContext context,
  //   required String message,
  //   required AlertSnackbarEnum status,
  //   AlertSnackbarPositionEnum position = AlertSnackbarPositionEnum.bottom,
  // }) {
  //   SnackBar snackBar = SnackBar(
  //     content: AlertSnackbar(message: message, status: status),
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     margin: position == AlertSnackbarPositionEnum.top
  //         ? EdgeInsets.only(top: 40, left: 16, right: 16)
  //         : EdgeInsets.only(bottom: 20, left: 16, right: 16),
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
