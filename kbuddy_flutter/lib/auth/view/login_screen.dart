import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/logger.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_me_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userMeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in or sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RadioListTile(
                      value: 'login',
                      groupValue: 'auth',
                      title: const Text('Log in'),
                      onChanged: (value) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email address or user ID',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {},
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                            ),
                            const Text('Remember me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state is UserModelLoading
                            ? null
                            : () async {
                                final resp = await ref.read(userMeProvider.notifier).login(emailController.text, passwordController.text);
                                logger.i(resp);
                              },
                        child: const Text('Log in'),
                      ),
                    ),
                    RadioListTile(
                      value: 'signup',
                      groupValue: 'auth',
                      title: const Text('Create account'),
                      onChanged: (value) {},
                    ),
                    const Divider(),
                    const Text('or'),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset('asset/icons/KakaoTalk_logo.png', height: 24),
                      label: const Text('Continue with KakaoTalk'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset('asset/icons/Google_G_logo.png', height: 24),
                      label: const Text('Continue with Google'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset('asset/icons/Apple_logo_grey.png', height: 24),
                      label: const Text('Continue with Apple'),
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
}
