import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/auth/provider/reset_password_provider.dart';
import 'package:kbuddy_flutter/auth/view/create_new_password_screen.dart';
import 'package:kbuddy_flutter/common/alert/view/alert_snackbar.dart';
import 'package:kbuddy_flutter/common/component/common_button.dart';
import 'package:kbuddy_flutter/common/component/custom_text_form_field2.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';

import '../../common/alert/provider/alert_snackbar_provider.dart';
import '../../common/component/text.dart';
import '../model/reset_password_model.dart';

class ResetPasswordConfirmScreen extends ConsumerStatefulWidget {
  const ResetPasswordConfirmScreen({super.key});

  @override
  _ResetPasswordConfirmScreenState createState() =>
      _ResetPasswordConfirmScreenState();
}

class _ResetPasswordConfirmScreenState
    extends ConsumerState<ResetPasswordConfirmScreen> {
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
    final state = ref.watch(resetPasswordProvider);
    final String? serverStatus = state?.status.toString();
    final String? serverMessage = state?.message.toString();
    // if (serverCode == null) {
    //   AlertSnackbarProvider.showAlertSnackbar(message: 'Please send the email again.', status: AlertSnackbarEnum.error, context: context, position: AlertSnackbarPositionEnum.bottom);
    //   context.pop();
    // }

    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: WHITE,
        leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlexText(
                                  content: 'Enter the confirmation code',
                                  textStyle: title100Medium),
                              SizedBox(height: 8),
                              FlexText(
                                  content:
                                      'Confirmation sent. To continue, enter the 6-digit code we sent to your email.',
                                  textStyle: body100Light),
                              SizedBox(height: 16),
                              CustomTextFormField2(
                                label: 'Confirmation code',
                                controller: codeController,
                                hintText: '123456',
                                isNumericOnly: true,
                              ),
                              SizedBox(height: 16),
                              Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(
                                        'asset/images/email_confirmation.png')),
                              ),
                              CommonButton(
                                name: "Next",
                                function: () async {
                                  await checkCode(serverStatus, serverMessage);
                                  // code 일치 여부 확인 후 맞으면 패스워드 재설정 화면으로 이동
                                },
                                isActivate: codeController.text.length >= 5,
                              ),
                              // LoginButton(
                              //     name: "Send link",
                              //     color: INDIGO_900,
                              //     function: () {
                              // state is UserModelLoading
                              //     ? null
                              //     : () async {
                              //         final resp = await ref
                              //             .read(
                              //                 userMeProvider.notifier)
                              //             .login(
                              //                 emailController.text,
                              //                 passwordController
                              //                     .text);
                              //         logger.i(resp);
                              //       };
                              // }),
                              SizedBox(height: 8),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    // 이메일 재전송
                                  },
                                  child: FlexText(
                                      content: "I didn't get the code",
                                      textStyle: btn200Lined),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkCode(String? serverStatus, String? serverMessage) async {
    if (serverStatus == 'true') {
      if (codeController.text.toString() == serverMessage) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateNewPasswordScreen(),
          ),
        );
      } else {
        // code 인증 잘못됨
        AlertSnackbarProvider.showAlertSnackbar(
            message: 'confirmation code is wrong.',
            status: AlertSnackbarEnum.error,
            context: context,
            position: AlertSnackbarPositionEnum.bottom);
      }
    } else {
      context.pop();
      AlertSnackbarProvider.showAlertSnackbar(
          message: 'try again.',
          status: AlertSnackbarEnum.error,
          context: context,
          position: AlertSnackbarPositionEnum.bottom);
    }
  }
}
