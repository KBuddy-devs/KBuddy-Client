import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/auth/provider/reset_password_provider.dart';
import 'package:kbuddy_flutter/auth/repository/reset_password_repository.dart';
import 'package:kbuddy_flutter/auth/view/reset_password_confirm_screen.dart';
import 'package:kbuddy_flutter/common/component/common_button.dart';
import 'package:kbuddy_flutter/common/component/login_button.dart';
import 'package:kbuddy_flutter/common/component/custom_text_form_field2.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';

import '../../common/alert/provider/alert_snackbar_provider.dart';
import '../../common/alert/view/alert_snackbar.dart';
import '../../common/component/text.dart';
import '../../common/provider/route_provider.dart';
import '../../common/utils/logger.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_me_provider.dart';
import '../model/reset_password_model.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordProvider);

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
                                  content: 'Reset password',
                                  textStyle: title100Medium),
                              SizedBox(height: 8),
                              FlexText(
                                  content:
                                      'Please enter your email address to request a link to password reset.',
                                  textStyle: body100Light),
                              SizedBox(height: 16),
                              CustomTextFormField2(
                                label: 'Email',
                                controller: emailController,
                                hintText: 'Enter your email here',
                              ),
                              SizedBox(height: 16),
                              Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(
                                      'asset/images/email_confirmation.png',
                                    )),
                              ),
                              CommonButton(
                                  name: "Send link",
                                  function: () async {
                                    await sendEmail();
                                  },
                                  isActivate: emailController.text.isNotEmpty),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlexText(
                                      content: 'Remember your password?',
                                      textStyle: body200Medium),
                                  SizedBox(width: 5),
                                  TextButton(
                                    onPressed: () {},
                                    child: FlexText(
                                        content: 'Log in',
                                        textStyle: btn200Lined),
                                  ),
                                ],
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

  sendEmail() async {
    final state = ref.watch(resetPasswordProvider);
    AlertSnackbarProvider.showAlertSnackbar(
        message: 'verification code is sent to your email address.',
        status: AlertSnackbarEnum.success,
        context: context,
        position: AlertSnackbarPositionEnum.bottom);
    final email = EmailModel(email: emailController.text);

    // 로딩 아이콘 표시.
    showDialog(
      context: context,
      // barrierDismissible: false, // 바깥쪽 터치로 닫히지 않도록 설정 가능
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(color: PRIMARY_COLOR),
        );
      },
    );

    await ref.read(resetPasswordProvider.notifier).sendEmail(email);
    logger.i('state :$state');

    // 로딩 아이콘 닫기.
    Navigator.pop(context);
    // 임시
    // 나중에는 로딩 아이콘 보여주면서
    // email code 정상으로 되면 초록 alert + 화면 넘기고
    // 비정상이면 빨간 alert + 화면 넘기지 않도록
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordConfirmScreen(),
      ),
    );
    // context.pushNamed(Routes.resetPasswordConfirm);
    // if (state is EmailConfirmModel) {
    //   // 페이지 이동
    //   if (context.mounted) {
    //     context.go(Routes.resetPasswordConfirm);
    //   }
    // }
  }
}
