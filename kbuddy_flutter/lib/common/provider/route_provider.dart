import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/auth/view/login_screen.dart';
import 'package:kbuddy_flutter/auth/view/reset_password_screen.dart';
import 'package:kbuddy_flutter/auth/view/signup_screen.dart';

import '../../auth/view/confirm_screen.dart';
import '../../auth/view/reset_password_confirm_screen.dart';
import '../../auth/view/splash_screen.dart';
import '../../community/view/community_screen.dart';
import '../view/default_screen.dart';

class Routes {
  static const root = '/';
  static const community = '/community';
  static const splash = '/splash';
  static const login = '/login';
  static const resetPassword = '/resetPassword';
  static const resetPasswordConfirm = '/resetPasswordConfirm';

  static List<GoRoute> get routes => [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) => const DefaultScreen(),
    ),
    GoRoute(
      path: '/community',
      name: 'community',
      builder: (context, state) => const CommunityScreen(),
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/resetPassword',
      name: 'resetPassword',
      builder: (context, state) => const ResetPasswordScreen(),
      routes: [
        GoRoute(
          path: '/resetPasswordConfirm',
          name: 'resetPasswordConfirm',
          builder: (context, state) => const ResetPasswordConfirmScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/confirm',
      name: 'confirm',
      builder: (context, state) => const ConfirmScreen(),
    ),
    GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpScreen())
  ];
}
