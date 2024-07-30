import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/auth/provider/reset_password_provider.dart';
import 'package:kbuddy_flutter/auth/view/create_new_password_screen.dart';
import 'package:kbuddy_flutter/auth/view/login_screen.dart';
import 'package:kbuddy_flutter/common/alert/view/alert_snackbar.dart';
import 'package:kbuddy_flutter/common/component/common_button.dart';
import 'package:kbuddy_flutter/common/component/custom_text_form_field2.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';
import 'package:kbuddy_flutter/common/provider/go_router.dart';

import '../../common/alert/provider/alert_snackbar_provider.dart';
import '../../common/component/text.dart';
import '../../common/provider/route_provider.dart';
import '../model/reset_password_model.dart';

class ResetPasswordCompleteScreen extends ConsumerStatefulWidget {
  const ResetPasswordCompleteScreen({super.key});

  @override
  _ResetPasswordCompleteScreenState createState() =>
      _ResetPasswordCompleteScreenState();
}

class _ResetPasswordCompleteScreenState
    extends ConsumerState<ResetPasswordCompleteScreen> {
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    codeController.addListener(() {
      setState(() {
        if (codeController.text.length >= 6) {}
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: WHITE,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight / 5, left: 8.0, right: 8.0, bottom: 8.0),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset('asset/images/circle_brand.png',
                            width: 80, height: 80)),
                    FlexText(
                        content: 'Password changed!',
                        textStyle: title300Medium),
                    const SizedBox(height: 8),
                    FlexText(
                        content: 'Your password has been changed successfully.',
                        textStyle: body200Light),
                    const SizedBox(height: 40),
                    CommonButton(
                      name: "Back to login",
                      function: () {
                        GoRouterFunction.popUntilPath(context, Routes.login);
                        // 테스트 필요.
                        // Navigator.of(context).popUntil((route) {
                        //   print("route: ${route.toString()}");
                        //   return route.toString() is LoginScreen;
                        // });
                        // Navigator.of(context).popUntil((route) => route.settings.name == Routes.login);
                        // context.go(Routes.login);
                      },
                      isActivate: true,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
