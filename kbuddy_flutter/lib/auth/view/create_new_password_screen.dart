import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/auth/provider/reset_password_provider.dart';
import 'package:kbuddy_flutter/auth/view/reset_password_complete_screen.dart';
import 'package:kbuddy_flutter/auth/view/reset_password_screen.dart';
import 'package:kbuddy_flutter/common/alert/view/alert_snackbar.dart';
import 'package:kbuddy_flutter/common/component/common_button.dart';
import 'package:kbuddy_flutter/common/component/custom_text_form_field2.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';

import '../../common/alert/provider/alert_snackbar_provider.dart';
import '../../common/component/regex.dart';
import '../../common/component/text.dart';
import '../../common/utils/logger.dart';
import '../model/reset_password_model.dart';

class CreateNewPasswordScreen extends ConsumerStatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState
    extends ConsumerState<CreateNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmFocusNode = FocusNode();
  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;

  @override
  void initState() {
    super.initState();
    passwordFocusNode.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocusNode.hasFocus;
      });
    });
    confirmFocusNode.addListener(() {
      setState(() {
        isConfirmPasswordFocused = confirmFocusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordProvider);
    // final String? serverCode = state?.status.toString();
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
            child: const Icon(Icons.arrow_back_outlined)),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlexText(
                                  content: 'Create new password',
                                  textStyle: title100Medium),
                              const SizedBox(height: 8),
                              FlexText(
                                  content:
                                      'Your new password must be different from those previously used.',
                                  textStyle: body100Light),
                              const SizedBox(height: 16),
                              CustomTextFormField2(
                                  label: 'New password',
                                  controller: passwordController,
                                  isPassword: true,
                                  focusNode: passwordFocusNode,
                                  onChanged: (text) {
                                    setState(() {});
                                    logger.i(
                                        'isPasswordFocused: $isPasswordFocused');
                                    // signUpViewModel.updatePassword(text);
                                  }),
                              const SizedBox(height: 8),
                              if (isPasswordFocused)
                                PasswordValidationWidget(
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text),
                              const SizedBox(height: 32),
                              CustomTextFormField2(
                                  label: 'Confirm password',
                                  controller: confirmPasswordController,
                                  isPassword: true,
                                  focusNode: confirmFocusNode,
                                  onChanged: (text) {
                                    setState(() {});
                                    // signUpViewModel.updatePassword(text);
                                  }),
                              const SizedBox(height: 8),
                              // isConfirm 값이 false이면 패스워드 일치 여부 확인하는 것 같은데,
                              // 기능 정확하게 동작하는지 여부 확인 필요
                              if (isConfirmPasswordFocused)
                                PasswordValidationWidget(
                                    password: confirmPasswordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
                                    isConfirm: false),

                              const SizedBox(height: 16),
                              Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(
                                        'asset/images/email_confirmation.png')),
                              ),
                              CommonButton(
                                name: "Reset password",
                                function: () async {
                                  await sendPassword();
                                },
                                isActivate: passwordController.text ==
                                    confirmPasswordController.text,
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

  Future<void> sendPassword() async {
    // final state = ref.watch(resetPasswordProvider);
    // final resetPasswordModel = ResetPasswordModel(password: passwordController.text);
    // await ref.read(resetPasswordProvider.notifier).sendNewPassword(resetPasswordModel);
    // logger.i('state :$state');
    // 임시
    // 나중에는 로딩 아이콘 보여주면서
    // email code 정상으로 되면 초록 alert + 화면 넘기고
    // 비정상이면 빨간 alert + 화면 넘기지 않도록
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordCompleteScreen(),
      ),
    );
    //   if (serverStatus == 'true') {
    //     if (codeController.text.toString() == serverMessage) {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const CreateNewPasswordScreen(),
    //         ),
    //       );
    //     } else {
    //       // code 인증 잘못됨
    //       AlertSnackbarProvider.showAlertSnackbar(message: 'confirmation code is wrong.', status: AlertSnackbarEnum.error, context: context, position: AlertSnackbarPositionEnum.bottom);
    //     }
    //   } else {
    //     context.pop();
    //     AlertSnackbarProvider.showAlertSnackbar(message: 'try again.', status: AlertSnackbarEnum.error, context: context, position: AlertSnackbarPositionEnum.bottom);
    //   }
  }
}
