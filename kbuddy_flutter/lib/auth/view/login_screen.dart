import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/common/component/login_button.dart';
import 'package:kbuddy_flutter/common/component/custom_text_form_field.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';

import '../../common/component/text.dart';
import '../../common/utils/logger.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_me_provider.dart';
import '../provider/signup_viewModel.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController createController = TextEditingController();


  bool rememberMe = false;
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userMeProvider);
    final signUpViewModel = ref.watch(signUpProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: FlexText(
          content: 'Log in or sign up',
          textStyle: title100Light,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 2.0,
            color: LIGHTGRAY_300,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PRIMARY_COLOR,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              color: isLogin ? INDIGO_200 : LIGHTGRAY_100,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: isLogin,
                                      onChanged: (value) {
                                        setState(() {
                                          isLogin = !isLogin;
                                        });
                                      }),
                                  Text("Log in"),
                                ],
                              ),
                            ),
                            isLogin
                                ? Container(
                                    child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        CustomTextFormField(
                                            label: 'Email address or user ID',
                                            controller: emailController),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        CustomTextFormField(
                                          label: 'Password',
                                          controller: passwordController,
                                          isPassword: true,
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: rememberMe,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      rememberMe =
                                                          value ?? false;
                                                    });
                                                  },
                                                ),
                                                const Text('Remember me'),
                                              ],
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                  'Forgot password?'),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        LoginButton(
                                            name: "Log in",
                                            function: () {
                                              state is UserModelLoading
                                                  ? null
                                                  : () async {
                                                      final resp = await ref
                                                          .read(userMeProvider
                                                              .notifier)
                                                          .login(
                                                              emailController
                                                                  .text,
                                                              passwordController
                                                                  .text);
                                                      logger.i(resp);
                                                    };
                                            }),
                                        SizedBox(
                                          height: 8,
                                        )
                                      ],
                                    ),
                                  ))
                                : SizedBox(
                                    height: 0,
                                  ),
                            Container(
                              decoration: BoxDecoration(
                                  color: !isLogin ? INDIGO_200 : LIGHTGRAY_100),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: !isLogin,
                                      onChanged: (value) {
                                        setState(() {
                                          isLogin = !isLogin;
                                        });
                                      }),
                                  Text("Create accout")
                                ],
                              ),
                            ),
                            !isLogin
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        CustomTextFormField(
                                            label: 'Email',
                                            controller: createController,
                                            onChanged: (email){
                                              signUpViewModel.updateEmail(email);
                                            },),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        LoginButton(
                                            name: "Continue", function: () {})
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    height: 0,
                                  )
                          ],
                        )),
                    const Divider(),
                    const Text('or'),
                    const SizedBox(height: 16),
                    LoginButton(
                        image: Image.asset('asset/icons/KakaoTalk_logo.png'),
                        name: "Continue with KaKao Talk",
                        color: Colors.white,
                        function: () {
                          logger.i("kakao");
                        }),
                    SizedBox(
                      height: 12,
                    ),
                    LoginButton(
                        image: Image.asset('asset/icons/Google_G_logo.png'),
                        name: "Continue with Google",
                        color: Colors.white,
                        function: () {
                          logger.i("Google");
                        }),
                    SizedBox(
                      height: 12,
                    ),
                    LoginButton(
                        image: Image.asset('asset/icons/Apple_logo_grey.png'),
                        name: "Continue with Apple",
                        color: Colors.white,
                        function: () {
                          logger.i("Apple");
                        }),
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
